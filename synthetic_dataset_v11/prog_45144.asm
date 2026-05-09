; DESCRIPTION: Draws a black rectangle at (187, 3) with width 36 and height 24.
; PLAN: r0=187(x), r1=3(y), r2=36(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 3
LDI r2, 36
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
