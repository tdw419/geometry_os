; DESCRIPTION: Composite: Renders a blue box of size 26x75 starting at (390, 32) then Draws a white circle centered at (409, 146) with radius 80 then Places a magenta dot at position (25, 177).
; PLAN: r0=390(x), r1=32(y), r2=26(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=146(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=25(x), r11=177(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 32
LDI r2, 26
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 146
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 25
LDI r11, 177
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
