; DESCRIPTION: Places a cyan 57x108 rectangle at position (179, 83).
; PLAN: r0=179(x), r1=83(y), r2=57(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 83
LDI r2, 57
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
