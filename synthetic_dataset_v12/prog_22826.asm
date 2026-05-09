; DESCRIPTION: Places a white 120x114 rectangle at position (325, 14).
; PLAN: r0=325(x), r1=14(y), r2=120(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 14
LDI r2, 120
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
