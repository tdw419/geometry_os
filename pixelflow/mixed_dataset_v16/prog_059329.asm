; DESCRIPTION: Composite: Renders a white disk with center (309, 190) and radius 41 then Places a green dot at position (144, 192) then Renders a magenta box of size 73x33 starting at (208, 198).
; PLAN: r0=309(x), r1=190(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=192(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=208(x), r11=198(y), r12=73(width), r13=33(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 190
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 192
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 208
LDI r11, 198
LDI r12, 73
LDI r13, 33
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
