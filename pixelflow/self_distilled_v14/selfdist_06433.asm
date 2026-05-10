; DESCRIPTION: Places a green disk with center (356, 190) and radius 67.
; PLAN: r0=356(x), r1=190(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 190
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
