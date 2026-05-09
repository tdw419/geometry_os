; DESCRIPTION: Places a white 100x76 rectangle at position (57, 110).
; PLAN: r0=57(x), r1=110(y), r2=100(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 110
LDI r2, 100
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
