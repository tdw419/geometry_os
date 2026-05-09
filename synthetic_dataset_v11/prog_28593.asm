; DESCRIPTION: Draws a red rectangle at (46, 128) with width 118 and height 109.
; PLAN: r0=46(x), r1=128(y), r2=118(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 128
LDI r2, 118
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
