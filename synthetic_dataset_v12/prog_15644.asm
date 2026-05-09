; DESCRIPTION: Draws a orange rectangle at (380, 110) with width 120 and height 85.
; PLAN: r0=380(x), r1=110(y), r2=120(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 110
LDI r2, 120
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
