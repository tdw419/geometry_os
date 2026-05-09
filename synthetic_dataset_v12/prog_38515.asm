; DESCRIPTION: Places a cyan 97x108 rectangle at position (7, 24).
; PLAN: r0=7(x), r1=24(y), r2=97(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 24
LDI r2, 97
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
