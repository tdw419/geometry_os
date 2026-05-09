; DESCRIPTION: Draws a orange rectangle at (329, 91) with width 90 and height 48.
; PLAN: r0=329(x), r1=91(y), r2=90(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 91
LDI r2, 90
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
