; DESCRIPTION: Draws a cyan rectangle at (87, 9) with width 81 and height 57.
; PLAN: r0=87(x), r1=9(y), r2=81(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 9
LDI r2, 81
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
