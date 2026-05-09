; DESCRIPTION: Places a cyan 34x78 rectangle at position (418, 78).
; PLAN: r0=418(x), r1=78(y), r2=34(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 78
LDI r2, 34
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
