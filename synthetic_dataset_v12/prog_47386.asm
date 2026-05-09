; DESCRIPTION: Draws a black rectangle at (202, 175) with width 74 and height 70.
; PLAN: r0=202(x), r1=175(y), r2=74(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 175
LDI r2, 74
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
