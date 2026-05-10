; DESCRIPTION: Places a magenta 56x37 box at position (237, 14).
; PLAN: r0=237(x), r1=14(y), r2=56(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 14
LDI r2, 56
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
