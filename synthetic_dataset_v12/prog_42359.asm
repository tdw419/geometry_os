; DESCRIPTION: Draws a black rectangle at (392, 94) with width 100 and height 54.
; PLAN: r0=392(x), r1=94(y), r2=100(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 94
LDI r2, 100
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
