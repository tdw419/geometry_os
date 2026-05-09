; DESCRIPTION: Draws a red rectangle at (278, 0) with width 33 and height 63.
; PLAN: r0=278(x), r1=0(y), r2=33(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 0
LDI r2, 33
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
