; DESCRIPTION: Composite: Creates a blue circular shape at (152, 130) with radius 20 then Places a white dot at position (91, 196).
; PLAN: r0=152(x), r1=130(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x), r6=196(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 152
LDI r1, 130
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 196
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
