; DESCRIPTION: Places a cyan 90x117 rectangle at position (89, 90).
; PLAN: r0=89(x), r1=90(y), r2=90(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 90
LDI r2, 90
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
