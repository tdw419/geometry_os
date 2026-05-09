; DESCRIPTION: Draws a orange rectangle at (7, 129) with width 65 and height 88.
; PLAN: r0=7(x), r1=129(y), r2=65(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 129
LDI r2, 65
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
