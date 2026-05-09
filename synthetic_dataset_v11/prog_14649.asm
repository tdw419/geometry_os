; DESCRIPTION: Draws a cyan rectangle at (56, 8) with width 86 and height 30.
; PLAN: r0=56(x), r1=8(y), r2=86(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 8
LDI r2, 86
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
