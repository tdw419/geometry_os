; DESCRIPTION: Places a cyan 34x35 box at position (241, 30).
; PLAN: r0=241(x), r1=30(y), r2=34(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 30
LDI r2, 34
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
