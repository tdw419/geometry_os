; DESCRIPTION: Places a cyan 31x69 rectangle at position (110, 114).
; PLAN: r0=110(x), r1=114(y), r2=31(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 114
LDI r2, 31
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
