; DESCRIPTION: Places a green 88x112 box at position (22, 53).
; PLAN: r0=22(x), r1=53(y), r2=88(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 53
LDI r2, 88
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
