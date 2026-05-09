; DESCRIPTION: Draws a orange rectangle at (45, 115) with width 20 and height 103.
; PLAN: r0=45(x), r1=115(y), r2=20(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 115
LDI r2, 20
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
