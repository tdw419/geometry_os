; DESCRIPTION: Composite: Renders a magenta box of size 75x116 starting at (69, 126) then Places a white dot at position (243, 237) then Creates a magenta circular shape at (77, 211) with radius 25.
; PLAN: r0=69(x), r1=126(y), r2=75(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=237(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=77(x), r11=211(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 69
LDI r1, 126
LDI r2, 75
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 237
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 77
LDI r11, 211
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
