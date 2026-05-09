; DESCRIPTION: Places a white 93x89 rectangle at position (130, 45).
; PLAN: r0=130(x), r1=45(y), r2=93(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 45
LDI r2, 93
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
