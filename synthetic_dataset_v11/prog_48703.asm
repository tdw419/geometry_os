; DESCRIPTION: Draws a orange rectangle at (130, 47) with width 37 and height 85.
; PLAN: r0=130(x), r1=47(y), r2=37(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 47
LDI r2, 37
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
