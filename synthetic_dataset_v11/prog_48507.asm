; DESCRIPTION: Composite: . Then Draws a green line from (9, 85) to (67, 30). Then Creates a magenta circular shape at (179, 106) with radius 59.
; PLAN: r0=9(x1), r1=85(y1), r2=67(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=179(x), r1=106(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (9, 85) to (67, 30).
; PLAN: r0=9(x1), r1=85(y1), r2=67(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 85
LDI r2, 67
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (179, 106) with radius 59.
; PLAN: r0=179(x), r1=106(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 106
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
