; DESCRIPTION: Draws a yellow rectangle at (201, 100) with width 42 and height 86.
; PLAN: r0=201(x), r1=100(y), r2=42(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 100
LDI r2, 42
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
