; DESCRIPTION: Draws a black rectangle at (262, 149) with width 24 and height 88.
; PLAN: r0=262(x), r1=149(y), r2=24(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 149
LDI r2, 24
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
