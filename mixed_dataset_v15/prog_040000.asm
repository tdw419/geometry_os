; DESCRIPTION: Draws a orange rectangle at (286, 80) with width 98 and height 79.
; PLAN: r0=286(x), r1=80(y), r2=98(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 80
LDI r2, 98
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
