; DESCRIPTION: Draws a red rectangle at (300, 103) with width 102 and height 75.
; PLAN: r0=300(x), r1=103(y), r2=102(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 103
LDI r2, 102
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
