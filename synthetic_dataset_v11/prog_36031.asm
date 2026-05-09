; DESCRIPTION: Renders a magenta box of size 12x47 starting at (148, 203).
; PLAN: r0=148(x), r1=203(y), r2=12(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 203
LDI r2, 12
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
