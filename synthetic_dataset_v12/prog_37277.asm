; DESCRIPTION: Draws a red rectangle at (274, 111) with width 105 and height 93.
; PLAN: r0=274(x), r1=111(y), r2=105(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 111
LDI r2, 105
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
