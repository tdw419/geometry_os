; DESCRIPTION: Draws a black rectangle at (384, 21) with width 79 and height 85.
; PLAN: r0=384(x), r1=21(y), r2=79(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 21
LDI r2, 79
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
