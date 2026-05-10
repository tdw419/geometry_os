; DESCRIPTION: Renders a magenta box of size 94x96 starting at (337, 28).
; PLAN: r0=337(x), r1=28(y), r2=94(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 28
LDI r2, 94
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
