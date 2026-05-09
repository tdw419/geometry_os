; DESCRIPTION: Composite: . Then Places a black dot at position (8, 15). Then Renders a red box of size 71x38 starting at (15, 2).
; PLAN: r0=8(x), r1=15(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=15(x), r1=2(y), r2=71(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (8, 15).
; PLAN: r0=8(x), r1=15(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 15
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a red box of size 71x38 starting at (15, 2).
; PLAN: r0=15(x), r1=2(y), r2=71(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 2
LDI r2, 71
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
