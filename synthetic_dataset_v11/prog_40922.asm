; DESCRIPTION: Draws a red rectangle at (174, 134) with width 11 and height 117.
; PLAN: r0=174(x), r1=134(y), r2=11(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 134
LDI r2, 11
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
