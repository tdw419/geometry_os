; DESCRIPTION: Draws a red rectangle at (243, 62) with width 56 and height 38.
; PLAN: r0=243(x), r1=62(y), r2=56(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 62
LDI r2, 56
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
