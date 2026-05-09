; DESCRIPTION: Composite: Renders a green box of size 115x36 starting at (112, 126) then Places a black dot at position (416, 216) then Renders a orange disk with center (347, 168) and radius 40.
; PLAN: r0=112(x), r1=126(y), r2=115(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x), r6=216(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=347(x), r11=168(y), r12=40(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 126
LDI r2, 115
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 216
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 347
LDI r11, 168
LDI r12, 40
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
