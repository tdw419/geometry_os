; DESCRIPTION: Composite: . Then Renders a blue line between points (26, 40) and (255, 203). Then Renders a black box of size 30x101 starting at (39, 1).
; PLAN: r0=26(x1), r1=40(y1), r2=255(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=39(x), r1=1(y), r2=30(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue line between points (26, 40) and (255, 203).
; PLAN: r0=26(x1), r1=40(y1), r2=255(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 40
LDI r2, 255
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black box of size 30x101 starting at (39, 1).
; PLAN: r0=39(x), r1=1(y), r2=30(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 1
LDI r2, 30
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
