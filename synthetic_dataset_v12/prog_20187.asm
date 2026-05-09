; DESCRIPTION: Composite: Creates a yellow circular shape at (347, 68) with radius 19 then Places a orange 63x25 rectangle at position (287, 68) then Places a red dot at position (206, 71).
; PLAN: r0=347(x), r1=68(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x), r6=68(y), r7=63(width), r8=25(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x), r11=71(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 68
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 68
LDI r7, 63
LDI r8, 25
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 71
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
