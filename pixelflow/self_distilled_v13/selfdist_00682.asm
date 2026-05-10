; DESCRIPTION: Places a magenta 117x33 box at position (57, 77).
; PLAN: r0=57(x), r1=77(y), r2=117(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 77
LDI r2, 117
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
