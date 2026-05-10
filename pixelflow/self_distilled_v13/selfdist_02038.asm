; DESCRIPTION: Places a yellow 66x25 box at position (281, 158).
; PLAN: r0=281(x), r1=158(y), r2=66(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 158
LDI r2, 66
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
