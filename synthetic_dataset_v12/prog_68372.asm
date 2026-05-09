; DESCRIPTION: Draws a black rectangle at (128, 16) with width 57 and height 96.
; PLAN: r0=128(x), r1=16(y), r2=57(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 16
LDI r2, 57
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
