; DESCRIPTION: Places a cyan 32x14 rectangle at position (99, 86).
; PLAN: r0=99(x), r1=86(y), r2=32(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 86
LDI r2, 32
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
