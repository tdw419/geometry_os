; DESCRIPTION: Places a green 10x88 box at position (345, 161).
; PLAN: r0=345(x), r1=161(y), r2=10(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 161
LDI r2, 10
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
