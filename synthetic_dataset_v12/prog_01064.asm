; DESCRIPTION: Renders a magenta box of size 77x37 starting at (221, 10).
; PLAN: r0=221(x), r1=10(y), r2=77(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 10
LDI r2, 77
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
