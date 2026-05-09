; DESCRIPTION: Draws a orange rectangle at (148, 95) with width 103 and height 14.
; PLAN: r0=148(x), r1=95(y), r2=103(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 95
LDI r2, 103
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
