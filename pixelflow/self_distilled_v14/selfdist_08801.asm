; DESCRIPTION: Draws a cyan rectangle at (293, 19) with width 22 and height 23.
; PLAN: r0=293(x), r1=19(y), r2=22(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 19
LDI r2, 22
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
