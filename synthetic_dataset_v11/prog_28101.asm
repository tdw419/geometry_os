; DESCRIPTION: Composite: . Then Renders a green line between points (213, 31) and (49, 135). Then Places a black circle of radius 67 at center (99, 106).
; PLAN: r0=213(x1), r1=31(y1), r2=49(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=99(x), r1=106(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green line between points (213, 31) and (49, 135).
; PLAN: r0=213(x1), r1=31(y1), r2=49(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 31
LDI r2, 49
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 67 at center (99, 106).
; PLAN: r0=99(x), r1=106(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 106
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
