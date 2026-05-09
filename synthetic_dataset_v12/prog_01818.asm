; DESCRIPTION: Places a red 23x102 rectangle at position (201, 152).
; PLAN: r0=201(x), r1=152(y), r2=23(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 152
LDI r2, 23
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
