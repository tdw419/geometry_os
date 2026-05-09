; DESCRIPTION: Draws a cyan rectangle at (363, 53) with width 56 and height 89.
; PLAN: r0=363(x), r1=53(y), r2=56(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 53
LDI r2, 56
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
