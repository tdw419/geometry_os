; DESCRIPTION: Places a magenta 51x57 box at position (247, 96).
; PLAN: r0=247(x), r1=96(y), r2=51(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 96
LDI r2, 51
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
