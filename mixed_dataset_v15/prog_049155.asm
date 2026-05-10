; DESCRIPTION: Draws a cyan rectangle at (314, 0) with width 18 and height 40.
; PLAN: r0=314(x), r1=0(y), r2=18(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 0
LDI r2, 18
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
