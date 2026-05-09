; DESCRIPTION: Places a orange 43x12 rectangle at position (155, 92).
; PLAN: r0=155(x), r1=92(y), r2=43(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 92
LDI r2, 43
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
