; DESCRIPTION: Places a cyan line segment connecting (62, 225) to (219, 39).
; PLAN: r0=62(x1), r1=225(y1), r2=219(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 225
LDI r2, 219
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
