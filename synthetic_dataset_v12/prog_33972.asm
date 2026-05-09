; DESCRIPTION: Places a orange 76x85 rectangle at position (241, 57).
; PLAN: r0=241(x), r1=57(y), r2=76(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 57
LDI r2, 76
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
