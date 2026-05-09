; DESCRIPTION: Renders a magenta box of size 58x99 starting at (217, 37).
; PLAN: r0=217(x), r1=37(y), r2=58(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 37
LDI r2, 58
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
