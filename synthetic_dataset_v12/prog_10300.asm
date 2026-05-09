; DESCRIPTION: Draws a black rectangle at (387, 21) with width 104 and height 67.
; PLAN: r0=387(x), r1=21(y), r2=104(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 21
LDI r2, 104
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
