; DESCRIPTION: Renders a magenta box of size 11x87 starting at (419, 138).
; PLAN: r0=419(x), r1=138(y), r2=11(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 138
LDI r2, 11
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
