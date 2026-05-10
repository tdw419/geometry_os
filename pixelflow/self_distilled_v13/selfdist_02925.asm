; DESCRIPTION: Places a red 66x101 box at position (281, 39).
; PLAN: r0=281(x), r1=39(y), r2=66(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 39
LDI r2, 66
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
