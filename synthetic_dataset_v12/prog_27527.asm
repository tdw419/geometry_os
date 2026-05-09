; DESCRIPTION: Draws a orange rectangle at (73, 50) with width 31 and height 79.
; PLAN: r0=73(x), r1=50(y), r2=31(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 50
LDI r2, 31
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
