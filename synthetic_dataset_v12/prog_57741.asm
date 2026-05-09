; DESCRIPTION: Draws a red rectangle at (69, 45) with width 90 and height 63.
; PLAN: r0=69(x), r1=45(y), r2=90(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 45
LDI r2, 90
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
