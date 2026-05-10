; DESCRIPTION: Composite: Places a yellow circle of radius 11 at center (32, 67) then Draws a black rectangle at (457, 123) with width 42 and height 54.
; PLAN: r0=32(x), r1=67(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=123(y), r7=42(width), r8=54(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 67
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 123
LDI r7, 42
LDI r8, 54
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
