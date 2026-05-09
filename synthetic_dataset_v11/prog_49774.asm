; DESCRIPTION: Places a magenta 87x12 rectangle at position (95, 17).
; PLAN: r0=95(x), r1=17(y), r2=87(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 17
LDI r2, 87
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
