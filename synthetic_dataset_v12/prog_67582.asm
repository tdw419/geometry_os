; DESCRIPTION: Places a white 60x102 rectangle at position (18, 80).
; PLAN: r0=18(x), r1=80(y), r2=60(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 80
LDI r2, 60
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
