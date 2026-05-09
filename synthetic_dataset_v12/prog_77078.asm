; DESCRIPTION: Draws a cyan rectangle at (451, 213) with width 40 and height 38.
; PLAN: r0=451(x), r1=213(y), r2=40(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 213
LDI r2, 40
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
