; DESCRIPTION: Places a white 45x45 rectangle at position (77, 123).
; PLAN: r0=77(x), r1=123(y), r2=45(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 123
LDI r2, 45
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
