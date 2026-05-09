; DESCRIPTION: Composite: . Then Draws a green rectangle at (72, 93) with width 14 and height 71. Then Sets a single red pixel at (138, 141).
; PLAN: r0=72(x), r1=93(y), r2=14(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=138(x), r1=141(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green rectangle at (72, 93) with width 14 and height 71.
; PLAN: r0=72(x), r1=93(y), r2=14(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 93
LDI r2, 14
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (138, 141).
; PLAN: r0=138(x), r1=141(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 141
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
