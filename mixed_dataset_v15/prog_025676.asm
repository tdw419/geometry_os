; DESCRIPTION: Places a cyan disk with center (217, 155) and radius 67.
; PLAN: r0=217(x), r1=155(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 155
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
