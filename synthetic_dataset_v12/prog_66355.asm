; DESCRIPTION: Draws a red rectangle at (46, 133) with width 62 and height 76.
; PLAN: r0=46(x), r1=133(y), r2=62(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 133
LDI r2, 62
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
