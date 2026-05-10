; DESCRIPTION: Draws a red rectangle at (20, 25) with width 12 and height 59.
; PLAN: r0=20(x), r1=25(y), r2=12(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 25
LDI r2, 12
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
