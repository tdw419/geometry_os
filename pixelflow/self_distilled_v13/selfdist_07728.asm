; DESCRIPTION: Draws a cyan rectangle at (124, 149) with width 39 and height 74.
; PLAN: r0=124(x), r1=149(y), r2=39(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 149
LDI r2, 39
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
