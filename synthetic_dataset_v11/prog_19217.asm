; DESCRIPTION: Renders a magenta box of size 116x80 starting at (140, 170).
; PLAN: r0=140(x), r1=170(y), r2=116(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 170
LDI r2, 116
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
