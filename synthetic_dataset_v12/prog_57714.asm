; DESCRIPTION: Draws a red rectangle at (359, 148) with width 57 and height 98.
; PLAN: r0=359(x), r1=148(y), r2=57(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 148
LDI r2, 57
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
