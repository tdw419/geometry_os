; DESCRIPTION: Draws a red rectangle at (83, 199) with width 54 and height 38.
; PLAN: r0=83(x), r1=199(y), r2=54(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 199
LDI r2, 54
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
