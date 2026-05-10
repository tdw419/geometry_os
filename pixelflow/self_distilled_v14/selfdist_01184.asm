; DESCRIPTION: Places a blue 91x93 box at position (187, 142).
; PLAN: r0=187(x), r1=142(y), r2=91(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 142
LDI r2, 91
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
