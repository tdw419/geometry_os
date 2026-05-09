; DESCRIPTION: Places a cyan line segment connecting (219, 240) to (240, 76).
; PLAN: r0=219(x1), r1=240(y1), r2=240(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 240
LDI r2, 240
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
