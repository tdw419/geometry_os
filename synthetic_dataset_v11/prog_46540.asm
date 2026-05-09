; DESCRIPTION: Composite: . Then Places a purple 12x120 rectangle at position (101, 46). Then Renders a black disk with center (124, 166) and radius 61.
; PLAN: r0=101(x), r1=46(y), r2=12(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=124(x), r1=166(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple 12x120 rectangle at position (101, 46).
; PLAN: r0=101(x), r1=46(y), r2=12(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 46
LDI r2, 12
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (124, 166) and radius 61.
; PLAN: r0=124(x), r1=166(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 166
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
