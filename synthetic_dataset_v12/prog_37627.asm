; DESCRIPTION: Draws a cyan rectangle at (358, 24) with width 26 and height 46.
; PLAN: r0=358(x), r1=24(y), r2=26(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 24
LDI r2, 26
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
