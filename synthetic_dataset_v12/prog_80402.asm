; DESCRIPTION: Draws a orange rectangle at (386, 211) with width 81 and height 45.
; PLAN: r0=386(x), r1=211(y), r2=81(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 211
LDI r2, 81
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
