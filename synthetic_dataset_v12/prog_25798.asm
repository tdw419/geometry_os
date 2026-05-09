; DESCRIPTION: Draws a yellow rectangle at (82, 108) with width 24 and height 70.
; PLAN: r0=82(x), r1=108(y), r2=24(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 108
LDI r2, 24
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
