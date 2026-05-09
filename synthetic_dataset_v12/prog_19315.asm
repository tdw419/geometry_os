; DESCRIPTION: Draws a orange rectangle at (20, 18) with width 45 and height 50.
; PLAN: r0=20(x), r1=18(y), r2=45(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 18
LDI r2, 45
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
