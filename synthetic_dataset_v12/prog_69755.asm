; DESCRIPTION: Places a cyan 25x78 rectangle at position (216, 45).
; PLAN: r0=216(x), r1=45(y), r2=25(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 45
LDI r2, 25
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
