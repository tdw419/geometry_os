; DESCRIPTION: Places a orange 15x78 rectangle at position (192, 31).
; PLAN: r0=192(x), r1=31(y), r2=15(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 31
LDI r2, 15
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
