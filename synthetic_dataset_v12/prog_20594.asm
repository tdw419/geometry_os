; DESCRIPTION: Draws a cyan rectangle at (40, 20) with width 26 and height 86.
; PLAN: r0=40(x), r1=20(y), r2=26(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 20
LDI r2, 26
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
