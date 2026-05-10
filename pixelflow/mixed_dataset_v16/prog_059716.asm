; DESCRIPTION: Draws a orange rectangle at (362, 6) with width 28 and height 10.
; PLAN: r0=362(x), r1=6(y), r2=28(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 6
LDI r2, 28
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
