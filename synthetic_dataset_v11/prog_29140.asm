; DESCRIPTION: Places a cyan 110x72 rectangle at position (20, 86).
; PLAN: r0=20(x), r1=86(y), r2=110(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 86
LDI r2, 110
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
