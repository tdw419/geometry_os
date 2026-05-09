; DESCRIPTION: Composite: Creates a purple circular shape at (394, 176) with radius 78 then Places a orange 86x81 rectangle at position (182, 48).
; PLAN: r0=394(x), r1=176(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=48(y), r7=86(width), r8=81(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 176
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 48
LDI r7, 86
LDI r8, 81
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
