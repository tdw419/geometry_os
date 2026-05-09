; DESCRIPTION: Composite: . Then Draws a red rectangle at (41, 41) with width 112 and height 113. Then Sets a single blue pixel at (169, 171).
; PLAN: r0=41(x), r1=41(y), r2=112(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=169(x), r1=171(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red rectangle at (41, 41) with width 112 and height 113.
; PLAN: r0=41(x), r1=41(y), r2=112(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 41
LDI r2, 112
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (169, 171).
; PLAN: r0=169(x), r1=171(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 171
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
