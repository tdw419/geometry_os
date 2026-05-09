; DESCRIPTION: Places a cyan 31x26 rectangle at position (273, 193).
; PLAN: r0=273(x), r1=193(y), r2=31(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 193
LDI r2, 31
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
