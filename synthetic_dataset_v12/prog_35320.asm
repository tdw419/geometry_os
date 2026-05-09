; DESCRIPTION: Composite: Renders a white box of size 112x110 starting at (267, 121) then Sets a single orange pixel at (361, 248) then Places a blue circle of radius 77 at center (242, 135).
; PLAN: r0=267(x), r1=121(y), r2=112(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=248(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=242(x), r11=135(y), r12=77(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 267
LDI r1, 121
LDI r2, 112
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 248
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 242
LDI r11, 135
LDI r12, 77
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
