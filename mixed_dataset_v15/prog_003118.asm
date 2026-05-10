; DESCRIPTION: Places a green 80x53 box at position (26, 57).
; PLAN: r0=26(x), r1=57(y), r2=80(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 57
LDI r2, 80
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
