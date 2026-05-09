; DESCRIPTION: Composite: Creates a green rectangular region at (159, 215) spanning 66 by 29 pixels then Places a white dot at position (240, 46) then Places a red circle of radius 42 at center (230, 112).
; PLAN: r0=159(x), r1=215(y), r2=66(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=46(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=230(x), r11=112(y), r12=42(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 159
LDI r1, 215
LDI r2, 66
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 46
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 230
LDI r11, 112
LDI r12, 42
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
