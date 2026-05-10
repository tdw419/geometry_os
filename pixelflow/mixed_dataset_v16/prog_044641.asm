; DESCRIPTION: Draws a yellow rectangle at (467, 135) with width 12 and height 100.
; PLAN: r0=467(x), r1=135(y), r2=12(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 135
LDI r2, 12
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
