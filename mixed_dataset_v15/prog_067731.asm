; DESCRIPTION: Places a cyan 105x97 rectangle at position (232, 102).
; PLAN: r0=232(x), r1=102(y), r2=105(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 102
LDI r2, 105
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
