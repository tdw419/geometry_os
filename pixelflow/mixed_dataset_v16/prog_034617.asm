; DESCRIPTION: Draws a yellow rectangle at (387, 138) with width 85 and height 21.
; PLAN: r0=387(x), r1=138(y), r2=85(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 138
LDI r2, 85
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
