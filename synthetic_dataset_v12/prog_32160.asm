; DESCRIPTION: Draws a orange rectangle at (185, 149) with width 114 and height 93.
; PLAN: r0=185(x), r1=149(y), r2=114(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 149
LDI r2, 114
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
