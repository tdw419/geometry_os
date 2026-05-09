; DESCRIPTION: Renders a magenta box of size 63x77 starting at (236, 163).
; PLAN: r0=236(x), r1=163(y), r2=63(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 163
LDI r2, 63
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
