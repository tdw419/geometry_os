; DESCRIPTION: Places a cyan 35x84 rectangle at position (133, 19).
; PLAN: r0=133(x), r1=19(y), r2=35(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 19
LDI r2, 35
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
