; DESCRIPTION: Places a orange 110x56 rectangle at position (249, 83).
; PLAN: r0=249(x), r1=83(y), r2=110(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 83
LDI r2, 110
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
