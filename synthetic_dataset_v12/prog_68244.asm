; DESCRIPTION: Draws a black rectangle at (394, 119) with width 74 and height 10.
; PLAN: r0=394(x), r1=119(y), r2=74(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 119
LDI r2, 74
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
