; DESCRIPTION: Draws a orange rectangle at (45, 20) with width 70 and height 107.
; PLAN: r0=45(x), r1=20(y), r2=70(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 20
LDI r2, 70
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
