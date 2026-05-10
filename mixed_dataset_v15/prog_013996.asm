; DESCRIPTION: Draws a red rectangle at (223, 134) with width 53 and height 25.
; PLAN: r0=223(x), r1=134(y), r2=53(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 134
LDI r2, 53
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
