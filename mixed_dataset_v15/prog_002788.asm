; DESCRIPTION: Places a cyan 11x115 box at position (77, 103).
; PLAN: r0=77(x), r1=103(y), r2=11(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 103
LDI r2, 11
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
