; DESCRIPTION: Draws a white rectangle at (323, 181) with width 60 and height 27.
; PLAN: r0=323(x), r1=181(y), r2=60(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 181
LDI r2, 60
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
