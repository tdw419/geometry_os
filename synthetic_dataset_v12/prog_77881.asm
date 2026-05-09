; DESCRIPTION: Draws a cyan rectangle at (484, 9) with width 27 and height 39.
; PLAN: r0=484(x), r1=9(y), r2=27(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 9
LDI r2, 27
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
