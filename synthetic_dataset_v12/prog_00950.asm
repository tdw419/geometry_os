; DESCRIPTION: Places a cyan 64x74 rectangle at position (4, 22).
; PLAN: r0=4(x), r1=22(y), r2=64(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 22
LDI r2, 64
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
