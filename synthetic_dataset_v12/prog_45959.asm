; DESCRIPTION: Draws a red rectangle at (160, 16) with width 81 and height 55.
; PLAN: r0=160(x), r1=16(y), r2=81(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 16
LDI r2, 81
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
