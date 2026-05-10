; DESCRIPTION: Draws a orange rectangle at (174, 103) with width 114 and height 48.
; PLAN: r0=174(x), r1=103(y), r2=114(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 103
LDI r2, 114
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
