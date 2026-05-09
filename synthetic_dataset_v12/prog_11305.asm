; DESCRIPTION: Composite: Places a orange circle of radius 78 at center (269, 117) then Places a yellow 30x116 rectangle at position (9, 86).
; PLAN: r0=269(x), r1=117(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=86(y), r7=30(width), r8=116(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 117
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 86
LDI r7, 30
LDI r8, 116
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
