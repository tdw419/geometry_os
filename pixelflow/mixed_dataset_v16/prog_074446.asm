; DESCRIPTION: Places a white 57x12 rectangle at position (139, 157).
; PLAN: r0=139(x), r1=157(y), r2=57(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 157
LDI r2, 57
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
