; DESCRIPTION: Places a white disk with center (243, 32) and radius 67.
; PLAN: r0=243(x), r1=32(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 32
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
