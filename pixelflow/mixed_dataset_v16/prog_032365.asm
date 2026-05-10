; DESCRIPTION: Places a magenta 107x63 rectangle at position (343, 37).
; PLAN: r0=343(x), r1=37(y), r2=107(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 37
LDI r2, 107
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
