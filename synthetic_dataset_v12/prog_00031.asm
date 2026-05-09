; DESCRIPTION: Renders a magenta box of size 96x112 starting at (354, 7).
; PLAN: r0=354(x), r1=7(y), r2=96(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 7
LDI r2, 96
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
