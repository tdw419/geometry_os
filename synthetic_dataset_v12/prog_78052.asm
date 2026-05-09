; DESCRIPTION: Places a cyan 52x10 rectangle at position (14, 110).
; PLAN: r0=14(x), r1=110(y), r2=52(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 110
LDI r2, 52
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
