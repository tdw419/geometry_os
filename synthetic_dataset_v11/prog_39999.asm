; DESCRIPTION: Draws a purple rectangle at (228, 91) with width 10 and height 44.
; PLAN: r0=228(x), r1=91(y), r2=10(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 91
LDI r2, 10
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
