; DESCRIPTION: Draws a yellow rectangle at (36, 173) with width 105 and height 40.
; PLAN: r0=36(x), r1=173(y), r2=105(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 173
LDI r2, 105
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
