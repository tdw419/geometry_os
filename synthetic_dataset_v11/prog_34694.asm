; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (173, 123) with radius 54. Then Places a magenta 83x65 rectangle at position (172, 28).
; PLAN: r0=173(x), r1=123(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=172(x), r1=28(y), r2=83(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (173, 123) with radius 54.
; PLAN: r0=173(x), r1=123(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 123
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta 83x65 rectangle at position (172, 28).
; PLAN: r0=172(x), r1=28(y), r2=83(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 28
LDI r2, 83
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
