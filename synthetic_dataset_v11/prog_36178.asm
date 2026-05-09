; DESCRIPTION: Composite: . Then Places a blue 120x32 rectangle at position (96, 71). Then Renders a purple disk with center (26, 123) and radius 10.
; PLAN: r0=96(x), r1=71(y), r2=120(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=26(x), r1=123(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 120x32 rectangle at position (96, 71).
; PLAN: r0=96(x), r1=71(y), r2=120(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 71
LDI r2, 120
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (26, 123) and radius 10.
; PLAN: r0=26(x), r1=123(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 123
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
