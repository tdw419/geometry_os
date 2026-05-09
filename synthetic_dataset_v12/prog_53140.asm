; DESCRIPTION: Composite: Places a magenta 107x118 rectangle at position (239, 121) then Sets a single white pixel at (290, 64) then Renders a cyan disk with center (25, 213) and radius 17.
; PLAN: r0=239(x), r1=121(y), r2=107(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x), r6=64(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=25(x), r11=213(y), r12=17(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 239
LDI r1, 121
LDI r2, 107
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 64
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 25
LDI r11, 213
LDI r12, 17
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
