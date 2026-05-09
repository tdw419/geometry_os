; DESCRIPTION: Draws a cyan rectangle at (128, 40) with width 43 and height 64.
; PLAN: r0=128(x), r1=40(y), r2=43(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 40
LDI r2, 43
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
