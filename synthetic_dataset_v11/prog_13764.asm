; DESCRIPTION: Composite: . Then Renders a yellow line between points (183, 84) and (183, 136). Then Creates a black rectangular region at (5, 104) spanning 93 by 111 pixels.
; PLAN: r0=183(x1), r1=84(y1), r2=183(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=5(x), r1=104(y), r2=93(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (183, 84) and (183, 136).
; PLAN: r0=183(x1), r1=84(y1), r2=183(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 84
LDI r2, 183
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black rectangular region at (5, 104) spanning 93 by 111 pixels.
; PLAN: r0=5(x), r1=104(y), r2=93(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 104
LDI r2, 93
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
