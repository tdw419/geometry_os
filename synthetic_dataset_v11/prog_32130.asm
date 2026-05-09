; DESCRIPTION: Draws a yellow rectangle at (70, 154) with width 53 and height 90.
; PLAN: r0=70(x), r1=154(y), r2=53(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 154
LDI r2, 53
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
