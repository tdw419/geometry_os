; DESCRIPTION: Draws a yellow rectangle at (82, 70) with width 89 and height 120.
; PLAN: r0=82(x), r1=70(y), r2=89(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 70
LDI r2, 89
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
