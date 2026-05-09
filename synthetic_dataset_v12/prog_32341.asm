; DESCRIPTION: Places a white 31x16 rectangle at position (201, 237).
; PLAN: r0=201(x), r1=237(y), r2=31(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 237
LDI r2, 31
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
