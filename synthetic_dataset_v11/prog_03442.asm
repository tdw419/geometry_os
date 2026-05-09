; DESCRIPTION: Places a cyan 18x87 rectangle at position (139, 21).
; PLAN: r0=139(x), r1=21(y), r2=18(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 21
LDI r2, 18
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
