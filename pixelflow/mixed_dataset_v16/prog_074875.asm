; DESCRIPTION: Places a orange 87x21 rectangle at position (10, 114).
; PLAN: r0=10(x), r1=114(y), r2=87(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 114
LDI r2, 87
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
