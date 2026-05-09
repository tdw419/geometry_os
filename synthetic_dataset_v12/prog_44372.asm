; DESCRIPTION: Renders a magenta box of size 81x13 starting at (275, 61).
; PLAN: r0=275(x), r1=61(y), r2=81(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 61
LDI r2, 81
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
