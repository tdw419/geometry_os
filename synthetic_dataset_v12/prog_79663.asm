; DESCRIPTION: Places a magenta 77x68 rectangle at position (129, 66).
; PLAN: r0=129(x), r1=66(y), r2=77(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 66
LDI r2, 77
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
