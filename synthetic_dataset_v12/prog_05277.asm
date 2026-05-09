; DESCRIPTION: Composite: Renders a black box of size 14x103 starting at (401, 110) then Renders a yellow line between points (352, 147) and (291, 176) then Places a black dot at position (332, 62).
; PLAN: r0=401(x), r1=110(y), r2=14(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x1), r6=147(y1), r7=291(x2), r8=176(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=332(x), r11=62(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 110
LDI r2, 14
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 147
LDI r7, 291
LDI r8, 176
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 62
LDI r12, 0x000000
PSET r10, r11, r12
HALT
