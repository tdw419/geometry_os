; DESCRIPTION: Places a cyan 17x95 rectangle at position (201, 139).
; PLAN: r0=201(x), r1=139(y), r2=17(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 139
LDI r2, 17
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
