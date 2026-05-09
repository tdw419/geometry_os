; DESCRIPTION: Draws a black rectangle at (449, 1) with width 57 and height 98.
; PLAN: r0=449(x), r1=1(y), r2=57(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 1
LDI r2, 57
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
