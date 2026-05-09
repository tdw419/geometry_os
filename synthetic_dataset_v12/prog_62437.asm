; DESCRIPTION: Draws a red rectangle at (142, 60) with width 80 and height 83.
; PLAN: r0=142(x), r1=60(y), r2=80(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 60
LDI r2, 80
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
