; DESCRIPTION: Places a orange 21x11 box at position (203, 30).
; PLAN: r0=203(x), r1=30(y), r2=21(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 30
LDI r2, 21
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
