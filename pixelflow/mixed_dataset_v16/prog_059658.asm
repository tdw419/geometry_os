; DESCRIPTION: Places a orange 104x19 rectangle at position (390, 13).
; PLAN: r0=390(x), r1=13(y), r2=104(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 13
LDI r2, 104
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
