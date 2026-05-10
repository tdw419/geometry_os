; DESCRIPTION: Places a green 32x22 box at position (66, 43).
; PLAN: r0=66(x), r1=43(y), r2=32(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 43
LDI r2, 32
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
