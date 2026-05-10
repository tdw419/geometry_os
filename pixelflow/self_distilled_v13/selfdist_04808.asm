; DESCRIPTION: Places a green 98x114 box at position (226, 42).
; PLAN: r0=226(x), r1=42(y), r2=98(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 42
LDI r2, 98
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
