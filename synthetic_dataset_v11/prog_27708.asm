; DESCRIPTION: Composite: . Then Sets a single red pixel at (137, 81). Then Draws a yellow rectangle at (55, 71) with width 29 and height 113.
; PLAN: r0=137(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=55(x), r1=71(y), r2=29(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (137, 81).
; PLAN: r0=137(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 81
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow rectangle at (55, 71) with width 29 and height 113.
; PLAN: r0=55(x), r1=71(y), r2=29(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 71
LDI r2, 29
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
