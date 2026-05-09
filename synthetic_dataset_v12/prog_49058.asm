; DESCRIPTION: Draws a yellow rectangle at (273, 107) with width 69 and height 78.
; PLAN: r0=273(x), r1=107(y), r2=69(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 107
LDI r2, 69
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
