; DESCRIPTION: Composite: Places a purple circle of radius 41 at center (137, 192) then Places a black 58x108 rectangle at position (182, 54).
; PLAN: r0=137(x), r1=192(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=54(y), r7=58(width), r8=108(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 192
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 54
LDI r7, 58
LDI r8, 108
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
