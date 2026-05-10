; DESCRIPTION: Draws a orange rectangle at (102, 196) with width 65 and height 90.
; PLAN: r0=102(x), r1=196(y), r2=65(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 196
LDI r2, 65
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
