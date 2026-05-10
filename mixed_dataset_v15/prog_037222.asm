; DESCRIPTION: Draws a red rectangle at (137, 16) with width 99 and height 27.
; PLAN: r0=137(x), r1=16(y), r2=99(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 16
LDI r2, 99
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
