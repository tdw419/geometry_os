; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (150, 167) with radius 69. Then Places a orange 98x11 rectangle at position (122, 157).
; PLAN: r0=150(x), r1=167(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=122(x), r1=157(y), r2=98(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (150, 167) with radius 69.
; PLAN: r0=150(x), r1=167(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 167
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange 98x11 rectangle at position (122, 157).
; PLAN: r0=122(x), r1=157(y), r2=98(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 157
LDI r2, 98
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
