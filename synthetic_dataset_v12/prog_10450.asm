; DESCRIPTION: Places a orange 60x60 rectangle at position (275, 101).
; PLAN: r0=275(x), r1=101(y), r2=60(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 101
LDI r2, 60
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
