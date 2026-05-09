; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (135, 137) with width 106 and height 119. Then Places a purple circle of radius 62 at center (111, 186).
; PLAN: r0=135(x), r1=137(y), r2=106(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=111(x), r1=186(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow rectangle at (135, 137) with width 106 and height 119.
; PLAN: r0=135(x), r1=137(y), r2=106(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 137
LDI r2, 106
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 62 at center (111, 186).
; PLAN: r0=111(x), r1=186(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 186
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
