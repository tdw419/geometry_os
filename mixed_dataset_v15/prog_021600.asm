; DESCRIPTION: Places a magenta 70x30 box at position (247, 138).
; PLAN: r0=247(x), r1=138(y), r2=70(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 138
LDI r2, 70
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
