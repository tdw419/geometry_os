; DESCRIPTION: Places a magenta 35x21 box at position (61, 109).
; PLAN: r0=61(x), r1=109(y), r2=35(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 109
LDI r2, 35
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
