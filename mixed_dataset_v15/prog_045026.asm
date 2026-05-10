; DESCRIPTION: Composite: Places a blue dot at position (107, 103) then Creates a green circular shape at (213, 144) with radius 79.
; PLAN: r0=107(x), r1=103(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=213(x), r6=144(y), r7=79(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 107
LDI r1, 103
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 213
LDI r6, 144
LDI r7, 79
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
