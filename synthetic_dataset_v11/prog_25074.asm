; DESCRIPTION: Composite: . Then Places a blue 102x75 rectangle at position (33, 15). Then Renders a blue disk with center (143, 214) and radius 33.
; PLAN: r0=33(x), r1=15(y), r2=102(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=143(x), r1=214(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 102x75 rectangle at position (33, 15).
; PLAN: r0=33(x), r1=15(y), r2=102(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 15
LDI r2, 102
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue disk with center (143, 214) and radius 33.
; PLAN: r0=143(x), r1=214(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 214
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
