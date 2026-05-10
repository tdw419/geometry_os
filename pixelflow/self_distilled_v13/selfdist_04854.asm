; DESCRIPTION: Draws a red rectangle at (313, 127) with width 117 and height 119.
; PLAN: r0=313(x), r1=127(y), r2=117(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 127
LDI r2, 117
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
