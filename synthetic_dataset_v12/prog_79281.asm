; DESCRIPTION: Places a cyan line segment connecting (341, 164) to (181, 217).
; PLAN: r0=341(x1), r1=164(y1), r2=181(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 164
LDI r2, 181
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
