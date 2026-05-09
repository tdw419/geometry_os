; DESCRIPTION: Places a white 79x26 rectangle at position (93, 149).
; PLAN: r0=93(x), r1=149(y), r2=79(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 149
LDI r2, 79
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
