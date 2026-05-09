; DESCRIPTION: Draws a cyan rectangle at (88, 58) with width 14 and height 57.
; PLAN: r0=88(x), r1=58(y), r2=14(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 58
LDI r2, 14
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
