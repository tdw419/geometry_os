; DESCRIPTION: Composite: . Then Places a magenta 53x110 rectangle at position (4, 56). Then Renders a yellow line between points (105, 76) and (225, 163).
; PLAN: r0=4(x), r1=56(y), r2=53(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=105(x1), r1=76(y1), r2=225(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta 53x110 rectangle at position (4, 56).
; PLAN: r0=4(x), r1=56(y), r2=53(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 56
LDI r2, 53
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow line between points (105, 76) and (225, 163).
; PLAN: r0=105(x1), r1=76(y1), r2=225(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 76
LDI r2, 225
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
