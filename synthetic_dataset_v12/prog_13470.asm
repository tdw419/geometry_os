; DESCRIPTION: Places a cyan 31x84 rectangle at position (20, 157).
; PLAN: r0=20(x), r1=157(y), r2=31(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 157
LDI r2, 31
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
