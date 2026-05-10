; DESCRIPTION: Draws a orange rectangle at (129, 10) with width 30 and height 48.
; PLAN: r0=129(x), r1=10(y), r2=30(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 10
LDI r2, 30
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
