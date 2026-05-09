; DESCRIPTION: Draws a black rectangle at (387, 124) with width 59 and height 116.
; PLAN: r0=387(x), r1=124(y), r2=59(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 124
LDI r2, 59
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
