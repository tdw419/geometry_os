; DESCRIPTION: Places a white 45x11 rectangle at position (196, 61).
; PLAN: r0=196(x), r1=61(y), r2=45(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 61
LDI r2, 45
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
