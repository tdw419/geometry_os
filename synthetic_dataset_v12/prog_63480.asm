; DESCRIPTION: Composite: Places a orange 87x98 rectangle at position (3, 24) then Places a yellow circle of radius 52 at center (265, 123).
; PLAN: r0=3(x), r1=24(y), r2=87(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=123(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 24
LDI r2, 87
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 123
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
