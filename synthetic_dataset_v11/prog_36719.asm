; DESCRIPTION: Composite: . Then Places a magenta 109x73 rectangle at position (8, 149). Then Creates a yellow circular shape at (162, 81) with radius 25.
; PLAN: r0=8(x), r1=149(y), r2=109(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=162(x), r1=81(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta 109x73 rectangle at position (8, 149).
; PLAN: r0=8(x), r1=149(y), r2=109(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 149
LDI r2, 109
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (162, 81) with radius 25.
; PLAN: r0=162(x), r1=81(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 81
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
