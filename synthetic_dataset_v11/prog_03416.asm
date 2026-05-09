; DESCRIPTION: Places a cyan 89x60 rectangle at position (55, 22).
; PLAN: r0=55(x), r1=22(y), r2=89(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 22
LDI r2, 89
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
