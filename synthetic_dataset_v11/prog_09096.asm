; DESCRIPTION: Composite: . Then Places a blue 84x14 rectangle at position (140, 91). Then Renders a yellow disk with center (185, 76) and radius 57.
; PLAN: r0=140(x), r1=91(y), r2=84(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=185(x), r1=76(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 84x14 rectangle at position (140, 91).
; PLAN: r0=140(x), r1=91(y), r2=84(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 91
LDI r2, 84
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (185, 76) and radius 57.
; PLAN: r0=185(x), r1=76(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 76
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
