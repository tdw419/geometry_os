; DESCRIPTION: Places a white 81x76 rectangle at position (193, 45).
; PLAN: r0=193(x), r1=45(y), r2=81(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 45
LDI r2, 81
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
