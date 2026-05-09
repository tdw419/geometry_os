; DESCRIPTION: Draws a yellow rectangle at (400, 47) with width 54 and height 117.
; PLAN: r0=400(x), r1=47(y), r2=54(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 47
LDI r2, 54
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
