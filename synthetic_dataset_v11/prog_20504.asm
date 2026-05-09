; DESCRIPTION: Draws a red rectangle at (44, 120) with width 73 and height 62.
; PLAN: r0=44(x), r1=120(y), r2=73(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 120
LDI r2, 73
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
