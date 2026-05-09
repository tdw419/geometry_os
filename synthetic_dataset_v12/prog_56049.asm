; DESCRIPTION: Composite: Draws a magenta circle centered at (223, 202) with radius 21 then Creates a green rectangular region at (126, 177) spanning 32 by 78 pixels then Places a green dot at position (224, 50).
; PLAN: r0=223(x), r1=202(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=177(y), r7=32(width), r8=78(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=224(x), r11=50(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 202
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 177
LDI r7, 32
LDI r8, 78
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 50
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
