; DESCRIPTION: Places a white 23x120 rectangle at position (201, 83).
; PLAN: r0=201(x), r1=83(y), r2=23(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 83
LDI r2, 23
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
