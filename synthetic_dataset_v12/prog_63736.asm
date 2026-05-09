; DESCRIPTION: Places a cyan 35x14 rectangle at position (447, 84).
; PLAN: r0=447(x), r1=84(y), r2=35(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 84
LDI r2, 35
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
