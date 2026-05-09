; DESCRIPTION: Composite: Renders a magenta box of size 11x81 starting at (395, 120) then Places a cyan dot at position (21, 33) then Draws a black circle centered at (215, 155) with radius 26.
; PLAN: r0=395(x), r1=120(y), r2=11(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x), r6=33(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=155(y), r12=26(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 395
LDI r1, 120
LDI r2, 11
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 33
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 155
LDI r12, 26
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
