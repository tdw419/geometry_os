; DESCRIPTION: Draws a black rectangle at (68, 10) with width 36 and height 120.
; PLAN: r0=68(x), r1=10(y), r2=36(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 10
LDI r2, 36
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
