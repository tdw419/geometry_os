; DESCRIPTION: Draws a cyan rectangle at (128, 76) with width 56 and height 90.
; PLAN: r0=128(x), r1=76(y), r2=56(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 76
LDI r2, 56
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
