; DESCRIPTION: Composite: Creates a green circular shape at (185, 102) with radius 60 then Renders a white box of size 64x53 starting at (267, 90) then Places a magenta dot at position (485, 2).
; PLAN: r0=185(x), r1=102(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=90(y), r7=64(width), r8=53(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=485(x), r11=2(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 185
LDI r1, 102
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 90
LDI r7, 64
LDI r8, 53
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 485
LDI r11, 2
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
