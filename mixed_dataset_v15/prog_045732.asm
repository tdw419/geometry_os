; DESCRIPTION: Places a white 53x110 rectangle at position (112, 128).
; PLAN: r0=112(x), r1=128(y), r2=53(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 128
LDI r2, 53
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
