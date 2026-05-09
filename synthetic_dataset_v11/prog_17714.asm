; DESCRIPTION: Composite: . Then Creates a black circular shape at (92, 124) with radius 51. Then Renders a magenta box of size 48x118 starting at (187, 71).
; PLAN: r0=92(x), r1=124(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=187(x), r1=71(y), r2=48(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (92, 124) with radius 51.
; PLAN: r0=92(x), r1=124(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 124
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta box of size 48x118 starting at (187, 71).
; PLAN: r0=187(x), r1=71(y), r2=48(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 71
LDI r2, 48
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
