; DESCRIPTION: Places a cyan 66x97 rectangle at position (134, 13).
; PLAN: r0=134(x), r1=13(y), r2=66(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 13
LDI r2, 66
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
