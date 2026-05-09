; DESCRIPTION: Renders a magenta box of size 52x107 starting at (444, 124).
; PLAN: r0=444(x), r1=124(y), r2=52(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 124
LDI r2, 52
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
