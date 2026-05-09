; DESCRIPTION: Composite: . Then Renders a blue line between points (246, 156) and (67, 85). Then Creates a yellow rectangular region at (16, 99) spanning 32 by 74 pixels.
; PLAN: r0=246(x1), r1=156(y1), r2=67(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=16(x), r1=99(y), r2=32(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue line between points (246, 156) and (67, 85).
; PLAN: r0=246(x1), r1=156(y1), r2=67(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 156
LDI r2, 67
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (16, 99) spanning 32 by 74 pixels.
; PLAN: r0=16(x), r1=99(y), r2=32(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 99
LDI r2, 32
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
