; DESCRIPTION: Places a orange 64x65 rectangle at position (120, 87).
; PLAN: r0=120(x), r1=87(y), r2=64(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 87
LDI r2, 64
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
