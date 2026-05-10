; DESCRIPTION: Draws a cyan rectangle at (268, 19) with width 120 and height 39.
; PLAN: r0=268(x), r1=19(y), r2=120(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 19
LDI r2, 120
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
