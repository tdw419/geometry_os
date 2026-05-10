; DESCRIPTION: Places a orange 12x78 rectangle at position (354, 56).
; PLAN: r0=354(x), r1=56(y), r2=12(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 56
LDI r2, 12
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
