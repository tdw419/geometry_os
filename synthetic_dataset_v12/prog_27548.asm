; DESCRIPTION: Draws a blue rectangle at (406, 46) with width 69 and height 72.
; PLAN: r0=406(x), r1=46(y), r2=69(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 46
LDI r2, 69
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
