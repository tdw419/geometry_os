; DESCRIPTION: Draws a red rectangle at (272, 128) with width 100 and height 115.
; PLAN: r0=272(x), r1=128(y), r2=100(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 128
LDI r2, 100
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
