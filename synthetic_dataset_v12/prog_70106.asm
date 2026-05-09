; DESCRIPTION: Draws a red rectangle at (132, 141) with width 47 and height 49.
; PLAN: r0=132(x), r1=141(y), r2=47(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 141
LDI r2, 47
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
