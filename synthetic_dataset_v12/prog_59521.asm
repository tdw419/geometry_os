; DESCRIPTION: Places a orange 27x17 rectangle at position (422, 78).
; PLAN: r0=422(x), r1=78(y), r2=27(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 78
LDI r2, 27
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
