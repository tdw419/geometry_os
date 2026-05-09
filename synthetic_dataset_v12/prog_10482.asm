; DESCRIPTION: Draws a cyan rectangle at (14, 22) with width 54 and height 57.
; PLAN: r0=14(x), r1=22(y), r2=54(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 22
LDI r2, 54
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
