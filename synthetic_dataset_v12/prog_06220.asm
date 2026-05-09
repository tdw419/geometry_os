; DESCRIPTION: Places a cyan 87x97 rectangle at position (211, 65).
; PLAN: r0=211(x), r1=65(y), r2=87(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 65
LDI r2, 87
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
