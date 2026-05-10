; DESCRIPTION: Places a magenta 12x112 rectangle at position (52, 109).
; PLAN: r0=52(x), r1=109(y), r2=12(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 109
LDI r2, 12
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
