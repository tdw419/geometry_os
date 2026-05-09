; DESCRIPTION: Draws a yellow rectangle at (121, 146) with width 27 and height 72.
; PLAN: r0=121(x), r1=146(y), r2=27(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 146
LDI r2, 27
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
