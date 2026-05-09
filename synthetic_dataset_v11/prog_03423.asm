; DESCRIPTION: Composite: . Then Renders a blue disk with center (138, 92) and radius 61. Then Places a yellow 105x17 rectangle at position (57, 82).
; PLAN: r0=138(x), r1=92(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=57(x), r1=82(y), r2=105(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (138, 92) and radius 61.
; PLAN: r0=138(x), r1=92(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 92
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 105x17 rectangle at position (57, 82).
; PLAN: r0=57(x), r1=82(y), r2=105(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 82
LDI r2, 105
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
