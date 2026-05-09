; DESCRIPTION: Renders a cyan disk with center (142, 107) and radius 67.
; PLAN: r0=142(x), r1=107(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 107
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
