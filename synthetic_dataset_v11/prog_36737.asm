; DESCRIPTION: Draws a cyan rectangle at (22, 24) with width 86 and height 37.
; PLAN: r0=22(x), r1=24(y), r2=86(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 24
LDI r2, 86
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
