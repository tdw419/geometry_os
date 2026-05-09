; DESCRIPTION: Renders a magenta box of size 28x107 starting at (323, 92).
; PLAN: r0=323(x), r1=92(y), r2=28(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 92
LDI r2, 28
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
