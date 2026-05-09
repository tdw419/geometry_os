; DESCRIPTION: Composite: Sets a single blue pixel at (334, 231) then Places a green 35x42 rectangle at position (174, 202) then Places a magenta circle of radius 79 at center (395, 136).
; PLAN: r0=334(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=202(y), r7=35(width), r8=42(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=395(x), r11=136(y), r12=79(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 231
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 202
LDI r7, 35
LDI r8, 42
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 136
LDI r12, 79
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
