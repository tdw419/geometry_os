; DESCRIPTION: Draws a orange rectangle at (33, 146) with width 90 and height 93.
; PLAN: r0=33(x), r1=146(y), r2=90(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 146
LDI r2, 90
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
