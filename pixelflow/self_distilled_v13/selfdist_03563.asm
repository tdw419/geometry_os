; DESCRIPTION: Places a magenta 35x16 box at position (393, 61).
; PLAN: r0=393(x), r1=61(y), r2=35(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 61
LDI r2, 35
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
