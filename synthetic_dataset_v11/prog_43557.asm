; DESCRIPTION: Renders a magenta box of size 119x116 starting at (49, 44).
; PLAN: r0=49(x), r1=44(y), r2=119(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 44
LDI r2, 119
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
