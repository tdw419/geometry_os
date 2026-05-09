; DESCRIPTION: Draws a purple rectangle at (298, 53) with width 58 and height 18.
; PLAN: r0=298(x), r1=53(y), r2=58(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 53
LDI r2, 58
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
