; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (44, 232) to (166, 199). Then Renders a magenta box of size 37x100 starting at (105, 83).
; PLAN: r0=44(x1), r1=232(y1), r2=166(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=105(x), r1=83(y), r2=37(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (44, 232) to (166, 199).
; PLAN: r0=44(x1), r1=232(y1), r2=166(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 232
LDI r2, 166
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 37x100 starting at (105, 83).
; PLAN: r0=105(x), r1=83(y), r2=37(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 83
LDI r2, 37
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
