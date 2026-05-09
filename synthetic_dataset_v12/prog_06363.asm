; DESCRIPTION: Places a white 91x14 rectangle at position (201, 65).
; PLAN: r0=201(x), r1=65(y), r2=91(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 65
LDI r2, 91
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
