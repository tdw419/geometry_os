; DESCRIPTION: Draws a cyan line from (90, 110) to (340, 168).
; PLAN: r0=90(x1), r1=110(y1), r2=340(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 110
LDI r2, 340
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
