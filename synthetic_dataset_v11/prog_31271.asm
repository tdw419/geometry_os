; DESCRIPTION: Draws a red rectangle at (164, 159) with width 15 and height 33.
; PLAN: r0=164(x), r1=159(y), r2=15(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 159
LDI r2, 15
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
