; DESCRIPTION: Places a cyan 84x83 rectangle at position (389, 90).
; PLAN: r0=389(x), r1=90(y), r2=84(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 90
LDI r2, 84
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
