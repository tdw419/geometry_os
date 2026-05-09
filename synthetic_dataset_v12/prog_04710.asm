; DESCRIPTION: Draws a orange rectangle at (163, 107) with width 87 and height 92.
; PLAN: r0=163(x), r1=107(y), r2=87(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 107
LDI r2, 87
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
