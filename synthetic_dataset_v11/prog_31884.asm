; DESCRIPTION: Composite: . Then Places a magenta 33x59 rectangle at position (222, 145). Then Renders a blue line between points (137, 106) and (252, 87).
; PLAN: r0=222(x), r1=145(y), r2=33(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=137(x1), r1=106(y1), r2=252(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta 33x59 rectangle at position (222, 145).
; PLAN: r0=222(x), r1=145(y), r2=33(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 145
LDI r2, 33
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (137, 106) and (252, 87).
; PLAN: r0=137(x1), r1=106(y1), r2=252(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 106
LDI r2, 252
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
