; DESCRIPTION: Draws a red rectangle at (121, 7) with width 91 and height 33.
; PLAN: r0=121(x), r1=7(y), r2=91(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 7
LDI r2, 91
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
