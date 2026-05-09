; DESCRIPTION: Draws a cyan line from (424, 90) to (90, 52).
; PLAN: r0=424(x1), r1=90(y1), r2=90(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 90
LDI r2, 90
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
