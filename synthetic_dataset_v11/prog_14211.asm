; DESCRIPTION: Places a cyan 96x110 rectangle at position (128, 43).
; PLAN: r0=128(x), r1=43(y), r2=96(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 43
LDI r2, 96
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
