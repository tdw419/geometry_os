; DESCRIPTION: Draws a red rectangle at (248, 71) with width 108 and height 97.
; PLAN: r0=248(x), r1=71(y), r2=108(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 71
LDI r2, 108
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
