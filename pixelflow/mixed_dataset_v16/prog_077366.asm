; DESCRIPTION: Composite: Sets a single green pixel at (287, 251) then Renders a magenta box of size 22x98 starting at (238, 72) then Places a purple circle of radius 21 at center (252, 188).
; PLAN: r0=287(x), r1=251(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=238(x), r6=72(y), r7=22(width), r8=98(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=252(x), r11=188(y), r12=21(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 251
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 238
LDI r6, 72
LDI r7, 22
LDI r8, 98
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 188
LDI r12, 21
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
