; DESCRIPTION: Places a white 83x76 rectangle at position (134, 82).
; PLAN: r0=134(x), r1=82(y), r2=83(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 82
LDI r2, 83
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
