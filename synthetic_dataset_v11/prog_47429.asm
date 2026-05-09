; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (214, 79). Then Renders a white box of size 11x17 starting at (184, 212).
; PLAN: r0=214(x), r1=79(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=184(x), r1=212(y), r2=11(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (214, 79).
; PLAN: r0=214(x), r1=79(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 79
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 11x17 starting at (184, 212).
; PLAN: r0=184(x), r1=212(y), r2=11(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 212
LDI r2, 11
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
