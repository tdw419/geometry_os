; DESCRIPTION: Draws a orange rectangle at (457, 38) with width 48 and height 50.
; PLAN: r0=457(x), r1=38(y), r2=48(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 38
LDI r2, 48
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
