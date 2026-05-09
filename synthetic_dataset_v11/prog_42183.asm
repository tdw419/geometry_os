; DESCRIPTION: Composite: . Then Draws a orange circle centered at (118, 126) with radius 41. Then Places a yellow 109x102 rectangle at position (3, 126).
; PLAN: r0=118(x), r1=126(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=3(x), r1=126(y), r2=109(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (118, 126) with radius 41.
; PLAN: r0=118(x), r1=126(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 126
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 109x102 rectangle at position (3, 126).
; PLAN: r0=3(x), r1=126(y), r2=109(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 126
LDI r2, 109
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
