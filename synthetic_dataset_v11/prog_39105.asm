; DESCRIPTION: Draws a black rectangle at (99, 152) with width 86 and height 38.
; PLAN: r0=99(x), r1=152(y), r2=86(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 152
LDI r2, 86
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
