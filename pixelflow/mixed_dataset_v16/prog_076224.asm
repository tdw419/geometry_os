; DESCRIPTION: Draws a cyan rectangle at (107, 18) with width 75 and height 86.
; PLAN: r0=107(x), r1=18(y), r2=75(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 18
LDI r2, 75
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
