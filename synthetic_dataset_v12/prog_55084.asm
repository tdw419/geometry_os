; DESCRIPTION: Draws a green rectangle at (22, 47) with width 98 and height 113.
; PLAN: r0=22(x), r1=47(y), r2=98(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 47
LDI r2, 98
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
