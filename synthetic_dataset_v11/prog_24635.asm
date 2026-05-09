; DESCRIPTION: Composite: . Then Draws a blue line from (133, 85) to (236, 100). Then Renders a blue box of size 49x37 starting at (195, 126).
; PLAN: r0=133(x1), r1=85(y1), r2=236(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=195(x), r1=126(y), r2=49(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue line from (133, 85) to (236, 100).
; PLAN: r0=133(x1), r1=85(y1), r2=236(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 85
LDI r2, 236
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 49x37 starting at (195, 126).
; PLAN: r0=195(x), r1=126(y), r2=49(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 126
LDI r2, 49
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
