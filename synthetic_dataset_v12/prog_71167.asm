; DESCRIPTION: Places a cyan 79x21 rectangle at position (381, 86).
; PLAN: r0=381(x), r1=86(y), r2=79(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 86
LDI r2, 79
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
