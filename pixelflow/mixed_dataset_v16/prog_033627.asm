; DESCRIPTION: Places a cyan line segment connecting (269, 136) to (85, 105).
; PLAN: r0=269(x1), r1=136(y1), r2=85(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 136
LDI r2, 85
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
