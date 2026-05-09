; DESCRIPTION: Places a cyan 110x94 rectangle at position (110, 124).
; PLAN: r0=110(x), r1=124(y), r2=110(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 124
LDI r2, 110
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
