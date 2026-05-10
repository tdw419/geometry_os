; DESCRIPTION: Draws a yellow rectangle at (367, 190) with width 69 and height 105.
; PLAN: r0=367(x), r1=190(y), r2=69(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 190
LDI r2, 69
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
