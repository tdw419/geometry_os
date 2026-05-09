; DESCRIPTION: Places a cyan 78x83 rectangle at position (116, 13).
; PLAN: r0=116(x), r1=13(y), r2=78(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 13
LDI r2, 78
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
