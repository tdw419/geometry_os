; DESCRIPTION: Places a magenta 43x92 box at position (384, 20).
; PLAN: r0=384(x), r1=20(y), r2=43(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 20
LDI r2, 43
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
