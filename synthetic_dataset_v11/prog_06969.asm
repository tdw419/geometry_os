; DESCRIPTION: Draws a cyan line from (50, 240) to (90, 149).
; PLAN: r0=50(x1), r1=240(y1), r2=90(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 240
LDI r2, 90
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
