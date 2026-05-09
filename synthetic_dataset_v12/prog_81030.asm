; DESCRIPTION: Places a magenta 30x56 rectangle at position (323, 51).
; PLAN: r0=323(x), r1=51(y), r2=30(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 51
LDI r2, 30
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
