; DESCRIPTION: Places a white 119x85 rectangle at position (38, 76).
; PLAN: r0=38(x), r1=76(y), r2=119(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 76
LDI r2, 119
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
