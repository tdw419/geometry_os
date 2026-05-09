; DESCRIPTION: Draws a white rectangle at (434, 176) with width 72 and height 56.
; PLAN: r0=434(x), r1=176(y), r2=72(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 176
LDI r2, 72
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
