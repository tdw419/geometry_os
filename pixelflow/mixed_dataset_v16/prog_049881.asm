; DESCRIPTION: Draws a yellow rectangle at (173, 187) with width 57 and height 54.
; PLAN: r0=173(x), r1=187(y), r2=57(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 187
LDI r2, 57
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
