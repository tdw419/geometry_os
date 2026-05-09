; DESCRIPTION: Draws a orange rectangle at (189, 85) with width 27 and height 54.
; PLAN: r0=189(x), r1=85(y), r2=27(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 85
LDI r2, 27
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
