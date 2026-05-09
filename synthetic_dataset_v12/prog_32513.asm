; DESCRIPTION: Places a cyan 89x23 rectangle at position (402, 124).
; PLAN: r0=402(x), r1=124(y), r2=89(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 124
LDI r2, 89
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
