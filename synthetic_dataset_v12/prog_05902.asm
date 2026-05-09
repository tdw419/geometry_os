; DESCRIPTION: Renders a blue disk with center (398, 107) and radius 21.
; PLAN: r0=398(x), r1=107(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 107
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
