; DESCRIPTION: Places a cyan 13x95 rectangle at position (139, 77).
; PLAN: r0=139(x), r1=77(y), r2=13(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 77
LDI r2, 13
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
