; DESCRIPTION: Composite: . Then Renders a purple line between points (101, 163) and (90, 114). Then Renders a green box of size 107x45 starting at (67, 189).
; PLAN: r0=101(x1), r1=163(y1), r2=90(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=67(x), r1=189(y), r2=107(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (101, 163) and (90, 114).
; PLAN: r0=101(x1), r1=163(y1), r2=90(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 163
LDI r2, 90
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green box of size 107x45 starting at (67, 189).
; PLAN: r0=67(x), r1=189(y), r2=107(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 189
LDI r2, 107
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
