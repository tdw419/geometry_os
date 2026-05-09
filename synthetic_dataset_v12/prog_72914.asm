; DESCRIPTION: Draws a red rectangle at (319, 90) with width 48 and height 78.
; PLAN: r0=319(x), r1=90(y), r2=48(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 90
LDI r2, 48
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
