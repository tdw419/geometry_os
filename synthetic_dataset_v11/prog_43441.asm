; DESCRIPTION: Draws a cyan rectangle at (66, 226) with width 18 and height 13.
; PLAN: r0=66(x), r1=226(y), r2=18(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 226
LDI r2, 18
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
