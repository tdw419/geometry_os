; DESCRIPTION: Composite: . Then Places a purple dot at position (30, 20). Then Renders a black box of size 20x116 starting at (20, 115).
; PLAN: r0=30(x), r1=20(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=20(x), r1=115(y), r2=20(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (30, 20).
; PLAN: r0=30(x), r1=20(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 20
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 20x116 starting at (20, 115).
; PLAN: r0=20(x), r1=115(y), r2=20(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 115
LDI r2, 20
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
