; DESCRIPTION: Places a orange 11x27 rectangle at position (353, 161).
; PLAN: r0=353(x), r1=161(y), r2=11(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 161
LDI r2, 11
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
