; DESCRIPTION: Renders a green disk with center (104, 162) and radius 67.
; PLAN: r0=104(x), r1=162(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 162
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
