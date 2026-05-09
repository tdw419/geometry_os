; DESCRIPTION: Draws a yellow rectangle at (434, 1) with width 74 and height 85.
; PLAN: r0=434(x), r1=1(y), r2=74(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 1
LDI r2, 74
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
