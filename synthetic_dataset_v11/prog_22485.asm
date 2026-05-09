; DESCRIPTION: Composite: . Then Renders a purple box of size 85x40 starting at (126, 65). Then Places a yellow line segment connecting (26, 105) to (7, 127).
; PLAN: r0=126(x), r1=65(y), r2=85(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=26(x1), r1=105(y1), r2=7(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple box of size 85x40 starting at (126, 65).
; PLAN: r0=126(x), r1=65(y), r2=85(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 65
LDI r2, 85
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (26, 105) to (7, 127).
; PLAN: r0=26(x1), r1=105(y1), r2=7(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 105
LDI r2, 7
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
