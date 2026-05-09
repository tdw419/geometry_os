; DESCRIPTION: Places a green circle of radius 67 at center (288, 158).
; PLAN: r0=288(x), r1=158(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 158
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
