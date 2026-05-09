; DESCRIPTION: Draws a cyan rectangle at (70, 83) with width 35 and height 57.
; PLAN: r0=70(x), r1=83(y), r2=35(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 83
LDI r2, 35
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
