; DESCRIPTION: Places a white 31x76 rectangle at position (189, 4).
; PLAN: r0=189(x), r1=4(y), r2=31(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 4
LDI r2, 31
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
