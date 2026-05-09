; DESCRIPTION: Draws a orange rectangle at (153, 120) with width 67 and height 10.
; PLAN: r0=153(x), r1=120(y), r2=67(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 120
LDI r2, 67
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
