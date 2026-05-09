; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (188, 122). Then Renders a yellow box of size 28x118 starting at (35, 47).
; PLAN: r0=188(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=35(x), r1=47(y), r2=28(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (188, 122).
; PLAN: r0=188(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 122
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 28x118 starting at (35, 47).
; PLAN: r0=35(x), r1=47(y), r2=28(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 47
LDI r2, 28
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
