; DESCRIPTION: Draws a yellow rectangle at (306, 150) with width 23 and height 103.
; PLAN: r0=306(x), r1=150(y), r2=23(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 150
LDI r2, 23
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
