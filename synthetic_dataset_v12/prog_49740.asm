; DESCRIPTION: Draws a black rectangle at (392, 11) with width 48 and height 81.
; PLAN: r0=392(x), r1=11(y), r2=48(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 11
LDI r2, 48
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
