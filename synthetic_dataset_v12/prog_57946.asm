; DESCRIPTION: Places a white 58x76 rectangle at position (282, 7).
; PLAN: r0=282(x), r1=7(y), r2=58(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 7
LDI r2, 58
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
