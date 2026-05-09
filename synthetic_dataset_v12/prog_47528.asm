; DESCRIPTION: Places a cyan 13x62 rectangle at position (248, 11).
; PLAN: r0=248(x), r1=11(y), r2=13(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 11
LDI r2, 13
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
