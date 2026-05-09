; DESCRIPTION: Draws a red rectangle at (90, 146) with width 115 and height 53.
; PLAN: r0=90(x), r1=146(y), r2=115(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 146
LDI r2, 115
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
