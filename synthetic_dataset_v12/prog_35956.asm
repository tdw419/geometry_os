; DESCRIPTION: Draws a orange rectangle at (235, 120) with width 102 and height 40.
; PLAN: r0=235(x), r1=120(y), r2=102(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 120
LDI r2, 102
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
