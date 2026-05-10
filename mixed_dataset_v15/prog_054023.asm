; DESCRIPTION: Draws a green rectangle at (60, 183) with width 85 and height 59.
; PLAN: r0=60(x), r1=183(y), r2=85(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 183
LDI r2, 85
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
