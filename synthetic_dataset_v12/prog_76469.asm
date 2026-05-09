; DESCRIPTION: Draws a red rectangle at (437, 145) with width 38 and height 53.
; PLAN: r0=437(x), r1=145(y), r2=38(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 145
LDI r2, 38
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
