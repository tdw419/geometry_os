; DESCRIPTION: Places a cyan 89x49 rectangle at position (157, 137).
; PLAN: r0=157(x), r1=137(y), r2=89(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 137
LDI r2, 89
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
