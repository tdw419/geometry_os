; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (177, 177). Then Draws a blue rectangle at (149, 69) with width 58 and height 36.
; PLAN: r0=177(x), r1=177(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=149(x), r1=69(y), r2=58(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (177, 177).
; PLAN: r0=177(x), r1=177(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 177
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue rectangle at (149, 69) with width 58 and height 36.
; PLAN: r0=149(x), r1=69(y), r2=58(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 69
LDI r2, 58
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
