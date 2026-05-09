; DESCRIPTION: Composite: Places a blue dot at position (442, 136) then Renders a magenta disk with center (249, 166) and radius 40.
; PLAN: r0=442(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=166(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 442
LDI r1, 136
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 249
LDI r6, 166
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
