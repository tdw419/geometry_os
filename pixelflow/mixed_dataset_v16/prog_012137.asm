; DESCRIPTION: Places a magenta 82x24 box at position (94, 126).
; PLAN: r0=94(x), r1=126(y), r2=82(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 126
LDI r2, 82
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
