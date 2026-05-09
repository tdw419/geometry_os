; DESCRIPTION: Places a cyan 67x13 rectangle at position (241, 201).
; PLAN: r0=241(x), r1=201(y), r2=67(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 201
LDI r2, 67
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
