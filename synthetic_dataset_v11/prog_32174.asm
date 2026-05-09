; DESCRIPTION: Composite: . Then Places a blue circle of radius 14 at center (22, 68). Then Draws a yellow line from (228, 158) to (239, 72).
; PLAN: r0=22(x), r1=68(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=228(x1), r1=158(y1), r2=239(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 14 at center (22, 68).
; PLAN: r0=22(x), r1=68(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 68
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (228, 158) to (239, 72).
; PLAN: r0=228(x1), r1=158(y1), r2=239(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 158
LDI r2, 239
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
