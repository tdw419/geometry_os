; DESCRIPTION: Draws a orange rectangle at (289, 96) with width 27 and height 66.
; PLAN: r0=289(x), r1=96(y), r2=27(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 96
LDI r2, 27
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
