; DESCRIPTION: Places a purple disk with center (242, 67) and radius 23.
; PLAN: r0=242(x), r1=67(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 67
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
