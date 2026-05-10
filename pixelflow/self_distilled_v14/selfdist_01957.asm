; DESCRIPTION: Places a magenta 17x28 box at position (224, 114).
; PLAN: r0=224(x), r1=114(y), r2=17(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 114
LDI r2, 17
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
