; DESCRIPTION: Draws a yellow rectangle at (277, 61) with width 67 and height 112.
; PLAN: r0=277(x), r1=61(y), r2=67(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 61
LDI r2, 67
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
