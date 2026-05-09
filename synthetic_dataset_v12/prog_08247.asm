; DESCRIPTION: Draws a yellow rectangle at (328, 70) with width 94 and height 60.
; PLAN: r0=328(x), r1=70(y), r2=94(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 70
LDI r2, 94
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
