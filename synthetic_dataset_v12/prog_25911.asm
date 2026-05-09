; DESCRIPTION: Places a magenta 12x90 rectangle at position (126, 77).
; PLAN: r0=126(x), r1=77(y), r2=12(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 77
LDI r2, 12
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
