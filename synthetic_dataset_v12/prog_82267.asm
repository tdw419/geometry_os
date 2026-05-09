; DESCRIPTION: Places a orange 87x12 rectangle at position (384, 75).
; PLAN: r0=384(x), r1=75(y), r2=87(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 75
LDI r2, 87
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
