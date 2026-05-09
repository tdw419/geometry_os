; DESCRIPTION: Places a orange 15x102 rectangle at position (454, 63).
; PLAN: r0=454(x), r1=63(y), r2=15(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 63
LDI r2, 15
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
