; DESCRIPTION: Composite: . Then Sets a single red pixel at (114, 196). Then Draws a magenta rectangle at (82, 122) with width 68 and height 46.
; PLAN: r0=114(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=82(x), r1=122(y), r2=68(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (114, 196).
; PLAN: r0=114(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta rectangle at (82, 122) with width 68 and height 46.
; PLAN: r0=82(x), r1=122(y), r2=68(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 122
LDI r2, 68
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
