; DESCRIPTION: Places a green 101x75 box at position (153, 165).
; PLAN: r0=153(x), r1=165(y), r2=101(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 165
LDI r2, 101
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
