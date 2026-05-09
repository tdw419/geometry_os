; DESCRIPTION: Draws a red rectangle at (91, 81) with width 79 and height 61.
; PLAN: r0=91(x), r1=81(y), r2=79(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 81
LDI r2, 79
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
