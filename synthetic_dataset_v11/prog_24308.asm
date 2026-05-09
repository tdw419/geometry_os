; DESCRIPTION: Draws a red rectangle at (141, 160) with width 93 and height 96.
; PLAN: r0=141(x), r1=160(y), r2=93(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 160
LDI r2, 93
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
