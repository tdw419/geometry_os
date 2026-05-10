; DESCRIPTION: Draws a cyan rectangle at (395, 7) with width 36 and height 14.
; PLAN: r0=395(x), r1=7(y), r2=36(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 7
LDI r2, 36
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
