; DESCRIPTION: Places a white 53x16 rectangle at position (13, 35).
; PLAN: r0=13(x), r1=35(y), r2=53(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 35
LDI r2, 53
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
