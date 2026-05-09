; DESCRIPTION: Draws a black rectangle at (345, 103) with width 107 and height 93.
; PLAN: r0=345(x), r1=103(y), r2=107(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 103
LDI r2, 107
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
