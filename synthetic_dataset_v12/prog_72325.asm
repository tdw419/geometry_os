; DESCRIPTION: Places a orange 31x78 rectangle at position (173, 115).
; PLAN: r0=173(x), r1=115(y), r2=31(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 115
LDI r2, 31
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
