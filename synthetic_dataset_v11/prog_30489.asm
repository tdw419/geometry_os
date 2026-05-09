; DESCRIPTION: Places a white 101x45 rectangle at position (14, 72).
; PLAN: r0=14(x), r1=72(y), r2=101(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 72
LDI r2, 101
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
