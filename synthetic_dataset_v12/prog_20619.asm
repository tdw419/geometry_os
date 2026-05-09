; DESCRIPTION: Places a white 89x63 rectangle at position (56, 26).
; PLAN: r0=56(x), r1=26(y), r2=89(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 26
LDI r2, 89
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
