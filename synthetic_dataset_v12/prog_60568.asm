; DESCRIPTION: Draws a yellow rectangle at (400, 142) with width 80 and height 61.
; PLAN: r0=400(x), r1=142(y), r2=80(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 142
LDI r2, 80
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
