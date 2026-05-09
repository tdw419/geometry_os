; DESCRIPTION: Draws a red rectangle at (174, 8) with width 25 and height 80.
; PLAN: r0=174(x), r1=8(y), r2=25(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 8
LDI r2, 25
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
