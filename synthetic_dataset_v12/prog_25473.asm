; DESCRIPTION: Places a cyan 34x70 rectangle at position (463, 81).
; PLAN: r0=463(x), r1=81(y), r2=34(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 81
LDI r2, 34
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
