; DESCRIPTION: Draws a red rectangle at (28, 200) with width 94 and height 53.
; PLAN: r0=28(x), r1=200(y), r2=94(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 200
LDI r2, 94
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
