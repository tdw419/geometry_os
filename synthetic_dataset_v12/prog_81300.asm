; DESCRIPTION: Draws a red rectangle at (34, 48) with width 74 and height 53.
; PLAN: r0=34(x), r1=48(y), r2=74(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 48
LDI r2, 74
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
