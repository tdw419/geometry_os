; DESCRIPTION: Draws a yellow rectangle at (241, 72) with width 10 and height 21.
; PLAN: r0=241(x), r1=72(y), r2=10(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 72
LDI r2, 10
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
