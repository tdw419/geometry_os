; DESCRIPTION: Draws a orange rectangle at (365, 154) with width 54 and height 11.
; PLAN: r0=365(x), r1=154(y), r2=54(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 154
LDI r2, 54
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
