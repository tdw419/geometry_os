; DESCRIPTION: Draws a orange rectangle at (214, 1) with width 96 and height 49.
; PLAN: r0=214(x), r1=1(y), r2=96(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 1
LDI r2, 96
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
