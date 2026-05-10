; DESCRIPTION: Composite: Places a green dot at position (26, 112) then Draws a white rectangle at (148, 42) with width 72 and height 71 then Places a orange circle of radius 61 at center (312, 112).
; PLAN: r0=26(x), r1=112(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=42(y), r7=72(width), r8=71(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=312(x), r11=112(y), r12=61(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 26
LDI r1, 112
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 148
LDI r6, 42
LDI r7, 72
LDI r8, 71
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 112
LDI r12, 61
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
