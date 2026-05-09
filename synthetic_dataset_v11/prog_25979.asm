; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (95, 7) with width 117 and height 93. Then Sets a single red pixel at (234, 22).
; PLAN: r0=95(x), r1=7(y), r2=117(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=234(x), r1=22(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (95, 7) with width 117 and height 93.
; PLAN: r0=95(x), r1=7(y), r2=117(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 7
LDI r2, 117
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (234, 22).
; PLAN: r0=234(x), r1=22(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 22
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
