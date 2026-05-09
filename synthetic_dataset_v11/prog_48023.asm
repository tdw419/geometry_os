; DESCRIPTION: Places a blue circle of radius 78 at center (135, 95).
; PLAN: r0=135(x), r1=95(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 95
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
