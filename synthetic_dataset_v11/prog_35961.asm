; DESCRIPTION: Composite: . Then Renders a magenta box of size 40x24 starting at (126, 197). Then Places a purple line segment connecting (78, 16) to (130, 129).
; PLAN: r0=126(x), r1=197(y), r2=40(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=78(x1), r1=16(y1), r2=130(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 40x24 starting at (126, 197).
; PLAN: r0=126(x), r1=197(y), r2=40(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 197
LDI r2, 40
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (78, 16) to (130, 129).
; PLAN: r0=78(x1), r1=16(y1), r2=130(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 16
LDI r2, 130
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
