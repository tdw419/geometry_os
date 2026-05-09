; DESCRIPTION: Composite: . Then Renders a red box of size 106x51 starting at (89, 102). Then Places a orange dot at position (177, 5).
; PLAN: r0=89(x), r1=102(y), r2=106(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x), r1=5(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red box of size 106x51 starting at (89, 102).
; PLAN: r0=89(x), r1=102(y), r2=106(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 102
LDI r2, 106
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (177, 5).
; PLAN: r0=177(x), r1=5(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 5
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
