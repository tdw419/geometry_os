; DESCRIPTION: Composite: Places a red dot at position (53, 153) then Draws a green rectangle at (416, 98) with width 54 and height 112 then Renders a orange disk with center (71, 177) and radius 63.
; PLAN: r0=53(x), r1=153(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=98(y), r7=54(width), r8=112(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=71(x), r11=177(y), r12=63(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 53
LDI r1, 153
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 416
LDI r6, 98
LDI r7, 54
LDI r8, 112
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 177
LDI r12, 63
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
