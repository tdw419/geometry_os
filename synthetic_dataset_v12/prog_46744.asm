; DESCRIPTION: Draws a cyan rectangle at (370, 84) with width 107 and height 44.
; PLAN: r0=370(x), r1=84(y), r2=107(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 84
LDI r2, 107
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
