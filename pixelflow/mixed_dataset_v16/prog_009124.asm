; DESCRIPTION: Places a magenta 64x28 box at position (165, 112).
; PLAN: r0=165(x), r1=112(y), r2=64(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 112
LDI r2, 64
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
