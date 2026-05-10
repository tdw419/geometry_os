; DESCRIPTION: Places a orange 70x31 rectangle at position (422, 194).
; PLAN: r0=422(x), r1=194(y), r2=70(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 194
LDI r2, 70
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
