; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (109, 101) with radius 49. Then Places a cyan 97x81 rectangle at position (67, 91).
; PLAN: r0=109(x), r1=101(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=67(x), r1=91(y), r2=97(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (109, 101) with radius 49.
; PLAN: r0=109(x), r1=101(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 101
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 97x81 rectangle at position (67, 91).
; PLAN: r0=67(x), r1=91(y), r2=97(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 91
LDI r2, 97
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
