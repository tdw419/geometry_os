; DESCRIPTION: Draws a red rectangle at (133, 125) with width 45 and height 80.
; PLAN: r0=133(x), r1=125(y), r2=45(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 125
LDI r2, 45
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
