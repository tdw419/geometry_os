; DESCRIPTION: Places a orange 110x35 rectangle at position (104, 123).
; PLAN: r0=104(x), r1=123(y), r2=110(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 123
LDI r2, 110
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
