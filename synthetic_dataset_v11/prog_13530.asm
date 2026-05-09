; DESCRIPTION: Places a magenta 14x56 rectangle at position (87, 126).
; PLAN: r0=87(x), r1=126(y), r2=14(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 126
LDI r2, 14
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
