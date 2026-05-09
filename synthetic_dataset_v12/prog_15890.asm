; DESCRIPTION: Draws a orange rectangle at (154, 26) with width 40 and height 48.
; PLAN: r0=154(x), r1=26(y), r2=40(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 26
LDI r2, 40
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
