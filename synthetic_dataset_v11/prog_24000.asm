; DESCRIPTION: Places a cyan 90x34 rectangle at position (128, 85).
; PLAN: r0=128(x), r1=85(y), r2=90(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 85
LDI r2, 90
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
