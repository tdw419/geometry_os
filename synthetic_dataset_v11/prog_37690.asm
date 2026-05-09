; DESCRIPTION: Places a cyan 120x17 rectangle at position (97, 78).
; PLAN: r0=97(x), r1=78(y), r2=120(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 78
LDI r2, 120
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
