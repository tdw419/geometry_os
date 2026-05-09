; DESCRIPTION: Composite: . Then Places a orange dot at position (51, 199). Then Renders a red box of size 72x29 starting at (116, 109).
; PLAN: r0=51(x), r1=199(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=116(x), r1=109(y), r2=72(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (51, 199).
; PLAN: r0=51(x), r1=199(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 199
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a red box of size 72x29 starting at (116, 109).
; PLAN: r0=116(x), r1=109(y), r2=72(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 109
LDI r2, 72
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
