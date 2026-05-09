; DESCRIPTION: Places a cyan line segment connecting (105, 175) to (222, 163).
; PLAN: r0=105(x1), r1=175(y1), r2=222(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 175
LDI r2, 222
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
