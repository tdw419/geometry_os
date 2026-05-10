; DESCRIPTION: Draws a yellow rectangle at (20, 150) with width 93 and height 102.
; PLAN: r0=20(x), r1=150(y), r2=93(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 150
LDI r2, 93
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
