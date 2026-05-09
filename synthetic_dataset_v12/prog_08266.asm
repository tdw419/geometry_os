; DESCRIPTION: Places a cyan 17x12 rectangle at position (45, 231).
; PLAN: r0=45(x), r1=231(y), r2=17(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 231
LDI r2, 17
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
