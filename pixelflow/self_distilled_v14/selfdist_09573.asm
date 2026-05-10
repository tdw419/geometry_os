; DESCRIPTION: Draws a red rectangle at (23, 76) with width 99 and height 13.
; PLAN: r0=23(x), r1=76(y), r2=99(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 76
LDI r2, 99
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
