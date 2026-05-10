; DESCRIPTION: Draws a yellow rectangle at (383, 175) with width 74 and height 45.
; PLAN: r0=383(x), r1=175(y), r2=74(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 175
LDI r2, 74
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
