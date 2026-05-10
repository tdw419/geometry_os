; DESCRIPTION: Places a green 68x24 box at position (361, 194).
; PLAN: r0=361(x), r1=194(y), r2=68(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 194
LDI r2, 68
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
