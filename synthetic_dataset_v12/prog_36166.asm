; DESCRIPTION: Places a yellow 110x30 rectangle at position (2, 128).
; PLAN: r0=2(x), r1=128(y), r2=110(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 128
LDI r2, 110
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
