; DESCRIPTION: Places a green 97x18 rectangle at position (194, 64).
; PLAN: r0=194(x), r1=64(y), r2=97(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 64
LDI r2, 97
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
