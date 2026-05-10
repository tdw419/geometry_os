; DESCRIPTION: Places a magenta 23x92 box at position (361, 34).
; PLAN: r0=361(x), r1=34(y), r2=23(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 34
LDI r2, 23
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
