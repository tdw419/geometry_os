; DESCRIPTION: Places a cyan 32x22 rectangle at position (83, 119).
; PLAN: r0=83(x), r1=119(y), r2=32(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 119
LDI r2, 32
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
