; DESCRIPTION: Composite: . Then Renders a orange line between points (247, 228) and (173, 123). Then Draws a yellow rectangle at (155, 149) with width 50 and height 81.
; PLAN: r0=247(x1), r1=228(y1), r2=173(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=155(x), r1=149(y), r2=50(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange line between points (247, 228) and (173, 123).
; PLAN: r0=247(x1), r1=228(y1), r2=173(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 228
LDI r2, 173
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (155, 149) with width 50 and height 81.
; PLAN: r0=155(x), r1=149(y), r2=50(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 149
LDI r2, 50
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
