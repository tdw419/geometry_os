; DESCRIPTION: Draws a orange rectangle at (79, 82) with width 75 and height 112.
; PLAN: r0=79(x), r1=82(y), r2=75(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 82
LDI r2, 75
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
