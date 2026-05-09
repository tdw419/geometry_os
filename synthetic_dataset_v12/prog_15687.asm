; DESCRIPTION: Draws a red rectangle at (454, 125) with width 16 and height 38.
; PLAN: r0=454(x), r1=125(y), r2=16(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 125
LDI r2, 16
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
