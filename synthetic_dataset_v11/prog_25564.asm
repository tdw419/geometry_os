; DESCRIPTION: Places a white 18x82 rectangle at position (16, 35).
; PLAN: r0=16(x), r1=35(y), r2=18(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 35
LDI r2, 18
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
