; DESCRIPTION: Composite: . Then Places a magenta circle of radius 62 at center (106, 183). Then Places a orange 120x36 rectangle at position (119, 50).
; PLAN: r0=106(x), r1=183(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=119(x), r1=50(y), r2=120(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 62 at center (106, 183).
; PLAN: r0=106(x), r1=183(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 183
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange 120x36 rectangle at position (119, 50).
; PLAN: r0=119(x), r1=50(y), r2=120(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 50
LDI r2, 120
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
