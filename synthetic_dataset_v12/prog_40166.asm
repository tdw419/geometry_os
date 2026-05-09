; DESCRIPTION: Draws a yellow rectangle at (349, 133) with width 49 and height 120.
; PLAN: r0=349(x), r1=133(y), r2=49(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 133
LDI r2, 49
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
