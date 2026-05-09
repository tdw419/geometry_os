; DESCRIPTION: Draws a cyan rectangle at (108, 119) with width 107 and height 12.
; PLAN: r0=108(x), r1=119(y), r2=107(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 119
LDI r2, 107
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
