; DESCRIPTION: Places a cyan 19x37 rectangle at position (162, 218).
; PLAN: r0=162(x), r1=218(y), r2=19(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 218
LDI r2, 19
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
