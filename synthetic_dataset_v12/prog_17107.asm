; DESCRIPTION: Draws a red rectangle at (183, 45) with width 20 and height 25.
; PLAN: r0=183(x), r1=45(y), r2=20(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 45
LDI r2, 20
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
