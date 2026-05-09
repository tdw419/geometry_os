; DESCRIPTION: Composite: . Then Places a black 100x52 rectangle at position (88, 75). Then Renders a red disk with center (179, 60) and radius 36.
; PLAN: r0=88(x), r1=75(y), r2=100(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=179(x), r1=60(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 100x52 rectangle at position (88, 75).
; PLAN: r0=88(x), r1=75(y), r2=100(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 75
LDI r2, 100
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (179, 60) and radius 36.
; PLAN: r0=179(x), r1=60(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 60
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
