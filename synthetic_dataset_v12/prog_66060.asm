; DESCRIPTION: Places a orange 13x31 rectangle at position (73, 184).
; PLAN: r0=73(x), r1=184(y), r2=13(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 184
LDI r2, 13
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
