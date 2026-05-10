; DESCRIPTION: Draws a red rectangle at (217, 150) with width 76 and height 106.
; PLAN: r0=217(x), r1=150(y), r2=76(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 150
LDI r2, 76
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
