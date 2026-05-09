; DESCRIPTION: Places a orange 44x110 rectangle at position (128, 103).
; PLAN: r0=128(x), r1=103(y), r2=44(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 103
LDI r2, 44
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
