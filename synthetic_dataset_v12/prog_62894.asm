; DESCRIPTION: Draws a red rectangle at (149, 126) with width 81 and height 117.
; PLAN: r0=149(x), r1=126(y), r2=81(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 126
LDI r2, 81
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
