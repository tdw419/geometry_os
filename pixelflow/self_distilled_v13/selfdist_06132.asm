; DESCRIPTION: Places a blue disk with center (187, 167) and radius 28.
; PLAN: r0=187(x), r1=167(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 167
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
