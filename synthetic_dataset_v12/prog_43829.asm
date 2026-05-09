; DESCRIPTION: Places a cyan 83x76 rectangle at position (84, 84).
; PLAN: r0=84(x), r1=84(y), r2=83(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 84
LDI r2, 83
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
