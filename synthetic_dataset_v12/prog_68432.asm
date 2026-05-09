; DESCRIPTION: Draws a red rectangle at (408, 137) with width 56 and height 72.
; PLAN: r0=408(x), r1=137(y), r2=56(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 137
LDI r2, 56
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
