; DESCRIPTION: Draws a cyan rectangle at (325, 78) with width 53 and height 46.
; PLAN: r0=325(x), r1=78(y), r2=53(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 78
LDI r2, 53
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
