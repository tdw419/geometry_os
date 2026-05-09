; DESCRIPTION: Places a orange 50x87 rectangle at position (444, 110).
; PLAN: r0=444(x), r1=110(y), r2=50(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 110
LDI r2, 50
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
