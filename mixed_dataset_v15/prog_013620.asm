; DESCRIPTION: Places a magenta 28x108 box at position (384, 196).
; PLAN: r0=384(x), r1=196(y), r2=28(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 196
LDI r2, 28
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
