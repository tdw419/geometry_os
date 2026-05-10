; DESCRIPTION: Composite: Renders a blue box of size 25x107 starting at (474, 77) then Places a cyan circle of radius 69 at center (168, 99) then Places a magenta dot at position (146, 178).
; PLAN: r0=474(x), r1=77(y), r2=25(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=99(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x), r11=178(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 474
LDI r1, 77
LDI r2, 25
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 99
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 178
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
