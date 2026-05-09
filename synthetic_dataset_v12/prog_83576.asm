; DESCRIPTION: Renders a magenta box of size 102x79 starting at (203, 40).
; PLAN: r0=203(x), r1=40(y), r2=102(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 40
LDI r2, 102
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
