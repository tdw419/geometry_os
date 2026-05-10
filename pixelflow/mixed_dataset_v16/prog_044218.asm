; DESCRIPTION: Composite: Draws a red rectangle at (421, 13) with width 24 and height 112 then Sets a single magenta pixel at (485, 246).
; PLAN: r0=421(x), r1=13(y), r2=24(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x), r6=246(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 13
LDI r2, 24
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 246
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
