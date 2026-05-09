; DESCRIPTION: Places a cyan 97x83 rectangle at position (33, 43).
; PLAN: r0=33(x), r1=43(y), r2=97(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 43
LDI r2, 97
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
