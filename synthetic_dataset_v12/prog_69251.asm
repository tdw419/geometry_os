; DESCRIPTION: Draws a yellow rectangle at (38, 180) with width 25 and height 12.
; PLAN: r0=38(x), r1=180(y), r2=25(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 180
LDI r2, 25
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
