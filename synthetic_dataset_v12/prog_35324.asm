; DESCRIPTION: Draws a yellow rectangle at (171, 57) with width 26 and height 113.
; PLAN: r0=171(x), r1=57(y), r2=26(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 57
LDI r2, 26
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
