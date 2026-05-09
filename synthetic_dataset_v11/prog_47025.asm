; DESCRIPTION: Places a red 35x16 rectangle at position (201, 14).
; PLAN: r0=201(x), r1=14(y), r2=35(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 14
LDI r2, 35
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
