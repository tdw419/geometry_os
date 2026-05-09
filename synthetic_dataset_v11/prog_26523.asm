; DESCRIPTION: Places a orange 17x66 rectangle at position (203, 124).
; PLAN: r0=203(x), r1=124(y), r2=17(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 124
LDI r2, 17
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
