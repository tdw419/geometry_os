; DESCRIPTION: Draws a red rectangle at (120, 84) with width 34 and height 61.
; PLAN: r0=120(x), r1=84(y), r2=34(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 84
LDI r2, 34
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
