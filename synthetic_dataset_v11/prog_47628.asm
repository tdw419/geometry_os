; DESCRIPTION: Places a cyan 30x97 rectangle at position (153, 159).
; PLAN: r0=153(x), r1=159(y), r2=30(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 159
LDI r2, 30
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
