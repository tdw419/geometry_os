; DESCRIPTION: Draws a yellow rectangle at (133, 61) with width 45 and height 56.
; PLAN: r0=133(x), r1=61(y), r2=45(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 61
LDI r2, 45
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
