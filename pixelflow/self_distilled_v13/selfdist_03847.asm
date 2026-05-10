; DESCRIPTION: Places a cyan 53x61 box at position (43, 10).
; PLAN: r0=43(x), r1=10(y), r2=53(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 10
LDI r2, 53
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
