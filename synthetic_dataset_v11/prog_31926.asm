; DESCRIPTION: Composite: . Then Renders a blue box of size 58x38 starting at (147, 166). Then Renders a red disk with center (102, 109) and radius 61.
; PLAN: r0=147(x), r1=166(y), r2=58(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=102(x), r1=109(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 58x38 starting at (147, 166).
; PLAN: r0=147(x), r1=166(y), r2=58(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 166
LDI r2, 58
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (102, 109) and radius 61.
; PLAN: r0=102(x), r1=109(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 109
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
