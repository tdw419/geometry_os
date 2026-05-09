; DESCRIPTION: Places a white 76x76 rectangle at position (9, 58).
; PLAN: r0=9(x), r1=58(y), r2=76(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 58
LDI r2, 76
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
