; DESCRIPTION: Places a cyan 30x78 rectangle at position (99, 16).
; PLAN: r0=99(x), r1=16(y), r2=30(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 16
LDI r2, 30
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
