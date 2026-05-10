; DESCRIPTION: Draws a red rectangle at (149, 184) with width 111 and height 38.
; PLAN: r0=149(x), r1=184(y), r2=111(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 184
LDI r2, 111
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
