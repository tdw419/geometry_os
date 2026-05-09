; DESCRIPTION: Places a orange 15x63 rectangle at position (439, 39).
; PLAN: r0=439(x), r1=39(y), r2=15(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 39
LDI r2, 15
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
