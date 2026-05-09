; DESCRIPTION: Draws a yellow rectangle at (202, 134) with width 96 and height 91.
; PLAN: r0=202(x), r1=134(y), r2=96(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 134
LDI r2, 96
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
