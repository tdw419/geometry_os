; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (148, 100) to (66, 206). Then Renders a green box of size 38x109 starting at (63, 119).
; PLAN: r0=148(x1), r1=100(y1), r2=66(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=63(x), r1=119(y), r2=38(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (148, 100) to (66, 206).
; PLAN: r0=148(x1), r1=100(y1), r2=66(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 100
LDI r2, 66
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green box of size 38x109 starting at (63, 119).
; PLAN: r0=63(x), r1=119(y), r2=38(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 119
LDI r2, 38
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
