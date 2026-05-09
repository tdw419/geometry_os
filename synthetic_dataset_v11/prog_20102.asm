; DESCRIPTION: Composite: . Then Renders a blue box of size 15x24 starting at (100, 152). Then Sets a single black pixel at (134, 95).
; PLAN: r0=100(x), r1=152(y), r2=15(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=134(x), r1=95(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 15x24 starting at (100, 152).
; PLAN: r0=100(x), r1=152(y), r2=15(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 152
LDI r2, 15
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (134, 95).
; PLAN: r0=134(x), r1=95(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 95
LDI r2, 0x000000
PSET r0, r1, r2
HALT
