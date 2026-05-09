; DESCRIPTION: Draws a cyan rectangle at (210, 13) with width 20 and height 97.
; PLAN: r0=210(x), r1=13(y), r2=20(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 13
LDI r2, 20
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
