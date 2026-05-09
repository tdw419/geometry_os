; DESCRIPTION: Draws a red rectangle at (271, 125) with width 20 and height 44.
; PLAN: r0=271(x), r1=125(y), r2=20(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 125
LDI r2, 20
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
