; DESCRIPTION: Draws a yellow rectangle at (229, 36) with width 49 and height 50.
; PLAN: r0=229(x), r1=36(y), r2=49(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 36
LDI r2, 49
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
