; DESCRIPTION: Places a cyan 15x97 rectangle at position (122, 44).
; PLAN: r0=122(x), r1=44(y), r2=15(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 44
LDI r2, 15
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
