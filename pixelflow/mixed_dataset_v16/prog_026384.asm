; DESCRIPTION: Draws a red rectangle at (55, 20) with width 24 and height 16.
; PLAN: r0=55(x), r1=20(y), r2=24(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 20
LDI r2, 24
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
