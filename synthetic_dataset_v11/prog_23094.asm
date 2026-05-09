; DESCRIPTION: Draws a magenta rectangle at (12, 107) with width 33 and height 30.
; PLAN: r0=12(x), r1=107(y), r2=33(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 107
LDI r2, 33
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
