; DESCRIPTION: Draws a orange rectangle at (444, 96) with width 36 and height 27.
; PLAN: r0=444(x), r1=96(y), r2=36(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 96
LDI r2, 36
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
