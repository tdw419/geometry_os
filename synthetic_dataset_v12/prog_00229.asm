; DESCRIPTION: Draws a black rectangle at (36, 208) with width 61 and height 39.
; PLAN: r0=36(x), r1=208(y), r2=61(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 208
LDI r2, 61
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
