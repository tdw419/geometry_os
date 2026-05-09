; DESCRIPTION: Draws a cyan line from (22, 85) to (478, 191).
; PLAN: r0=22(x1), r1=85(y1), r2=478(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 85
LDI r2, 478
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
