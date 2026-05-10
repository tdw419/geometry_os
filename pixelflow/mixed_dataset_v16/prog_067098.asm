; DESCRIPTION: Draws a black rectangle at (392, 124) with width 49 and height 118.
; PLAN: r0=392(x), r1=124(y), r2=49(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 124
LDI r2, 49
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
