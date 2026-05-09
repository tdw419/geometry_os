; DESCRIPTION: Draws a purple rectangle at (46, 31) with width 40 and height 30.
; PLAN: r0=46(x), r1=31(y), r2=40(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 31
LDI r2, 40
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
