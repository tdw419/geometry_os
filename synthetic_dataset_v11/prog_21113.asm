; DESCRIPTION: Places a white 42x11 rectangle at position (89, 11).
; PLAN: r0=89(x), r1=11(y), r2=42(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 11
LDI r2, 42
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
