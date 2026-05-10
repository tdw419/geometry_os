; DESCRIPTION: Draws a cyan rectangle at (108, 127) with width 37 and height 74.
; PLAN: r0=108(x), r1=127(y), r2=37(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 127
LDI r2, 37
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
