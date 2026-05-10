; DESCRIPTION: Draws a red rectangle at (231, 83) with width 69 and height 117.
; PLAN: r0=231(x), r1=83(y), r2=69(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 83
LDI r2, 69
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
