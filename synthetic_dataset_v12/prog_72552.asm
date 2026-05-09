; DESCRIPTION: Places a white 60x95 rectangle at position (73, 35).
; PLAN: r0=73(x), r1=35(y), r2=60(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 35
LDI r2, 60
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
