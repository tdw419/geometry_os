; DESCRIPTION: Places a magenta 66x74 box at position (313, 129).
; PLAN: r0=313(x), r1=129(y), r2=66(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 129
LDI r2, 66
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
