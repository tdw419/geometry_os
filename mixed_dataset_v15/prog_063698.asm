; DESCRIPTION: Places a orange 94x54 rectangle at position (104, 201).
; PLAN: r0=104(x), r1=201(y), r2=94(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 201
LDI r2, 94
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
