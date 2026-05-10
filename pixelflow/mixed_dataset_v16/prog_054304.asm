; DESCRIPTION: Places a cyan 115x83 box at position (276, 108).
; PLAN: r0=276(x), r1=108(y), r2=115(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 108
LDI r2, 115
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
