; DESCRIPTION: Composite: . Then Renders a blue disk with center (59, 188) and radius 35. Then Places a blue 58x101 rectangle at position (78, 46).
; PLAN: r0=59(x), r1=188(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=78(x), r1=46(y), r2=58(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (59, 188) and radius 35.
; PLAN: r0=59(x), r1=188(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 188
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 58x101 rectangle at position (78, 46).
; PLAN: r0=78(x), r1=46(y), r2=58(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 46
LDI r2, 58
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
