; DESCRIPTION: Renders a magenta box of size 106x87 starting at (382, 25).
; PLAN: r0=382(x), r1=25(y), r2=106(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 25
LDI r2, 106
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
