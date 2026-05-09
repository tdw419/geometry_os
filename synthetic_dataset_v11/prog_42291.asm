; DESCRIPTION: Draws a red rectangle at (40, 17) with width 55 and height 86.
; PLAN: r0=40(x), r1=17(y), r2=55(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 17
LDI r2, 55
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
