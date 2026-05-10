; DESCRIPTION: Draws a red rectangle at (250, 10) with width 53 and height 38.
; PLAN: r0=250(x), r1=10(y), r2=53(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 10
LDI r2, 53
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
