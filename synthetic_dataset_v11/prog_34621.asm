; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (39, 166). Then Renders a red box of size 39x62 starting at (43, 100).
; PLAN: r0=39(x), r1=166(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=43(x), r1=100(y), r2=39(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (39, 166).
; PLAN: r0=39(x), r1=166(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 166
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a red box of size 39x62 starting at (43, 100).
; PLAN: r0=43(x), r1=100(y), r2=39(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 100
LDI r2, 39
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
