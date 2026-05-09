; DESCRIPTION: Composite: . Then Places a white circle of radius 16 at center (217, 163). Then Renders a white box of size 102x24 starting at (52, 148).
; PLAN: r0=217(x), r1=163(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=52(x), r1=148(y), r2=102(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 16 at center (217, 163).
; PLAN: r0=217(x), r1=163(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 163
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white box of size 102x24 starting at (52, 148).
; PLAN: r0=52(x), r1=148(y), r2=102(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 148
LDI r2, 102
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
