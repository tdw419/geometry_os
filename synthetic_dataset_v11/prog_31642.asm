; DESCRIPTION: Draws a yellow rectangle at (126, 109) with width 97 and height 120.
; PLAN: r0=126(x), r1=109(y), r2=97(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 109
LDI r2, 97
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
