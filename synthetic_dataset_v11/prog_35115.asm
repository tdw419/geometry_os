; DESCRIPTION: Composite: . Then Renders a magenta box of size 117x84 starting at (8, 129). Then Places a black line segment connecting (108, 208) to (79, 36).
; PLAN: r0=8(x), r1=129(y), r2=117(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x1), r1=208(y1), r2=79(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 117x84 starting at (8, 129).
; PLAN: r0=8(x), r1=129(y), r2=117(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 129
LDI r2, 117
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (108, 208) to (79, 36).
; PLAN: r0=108(x1), r1=208(y1), r2=79(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 208
LDI r2, 79
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
