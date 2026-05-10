; DESCRIPTION: Places a cyan 86x57 rectangle at position (402, 157).
; PLAN: r0=402(x), r1=157(y), r2=86(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 157
LDI r2, 86
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
