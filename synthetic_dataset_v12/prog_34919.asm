; DESCRIPTION: Places a cyan 71x97 rectangle at position (87, 24).
; PLAN: r0=87(x), r1=24(y), r2=71(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 24
LDI r2, 71
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
