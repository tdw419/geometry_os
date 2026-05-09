; DESCRIPTION: Draws a red rectangle at (142, 90) with width 83 and height 98.
; PLAN: r0=142(x), r1=90(y), r2=83(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 90
LDI r2, 83
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
