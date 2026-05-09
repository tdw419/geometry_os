; DESCRIPTION: Draws a red rectangle at (240, 16) with width 91 and height 43.
; PLAN: r0=240(x), r1=16(y), r2=91(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 16
LDI r2, 91
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
