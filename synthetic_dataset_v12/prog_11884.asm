; DESCRIPTION: Places a cyan 37x12 rectangle at position (87, 45).
; PLAN: r0=87(x), r1=45(y), r2=37(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 45
LDI r2, 37
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
