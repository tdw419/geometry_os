; DESCRIPTION: Places a orange 86x84 rectangle at position (422, 26).
; PLAN: r0=422(x), r1=26(y), r2=86(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 26
LDI r2, 86
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
