; DESCRIPTION: Draws a black rectangle at (37, 152) with width 64 and height 28.
; PLAN: r0=37(x), r1=152(y), r2=64(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 152
LDI r2, 64
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
