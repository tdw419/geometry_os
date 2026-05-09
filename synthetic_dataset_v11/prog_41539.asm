; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (116, 113) with radius 39. Then Places a cyan 44x68 rectangle at position (88, 52).
; PLAN: r0=116(x), r1=113(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=88(x), r1=52(y), r2=44(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (116, 113) with radius 39.
; PLAN: r0=116(x), r1=113(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 113
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 44x68 rectangle at position (88, 52).
; PLAN: r0=88(x), r1=52(y), r2=44(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 52
LDI r2, 44
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
