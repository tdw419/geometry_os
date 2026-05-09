; DESCRIPTION: Draws a black rectangle at (356, 149) with width 71 and height 86.
; PLAN: r0=356(x), r1=149(y), r2=71(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 149
LDI r2, 71
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
