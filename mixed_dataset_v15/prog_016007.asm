; DESCRIPTION: Composite: Renders a orange line between points (275, 43) and (257, 158) then Places a cyan 10x17 rectangle at position (67, 43).
; PLAN: r0=275(x1), r1=43(y1), r2=257(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=43(y), r7=10(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 43
LDI r2, 257
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 43
LDI r7, 10
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
