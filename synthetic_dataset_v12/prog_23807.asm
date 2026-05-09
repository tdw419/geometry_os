; DESCRIPTION: Draws a yellow rectangle at (429, 123) with width 67 and height 93.
; PLAN: r0=429(x), r1=123(y), r2=67(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 123
LDI r2, 67
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
