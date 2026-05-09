; DESCRIPTION: Draws a cyan rectangle at (188, 19) with width 28 and height 57.
; PLAN: r0=188(x), r1=19(y), r2=28(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 19
LDI r2, 28
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
