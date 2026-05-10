; DESCRIPTION: Renders a magenta box of size 58x116 starting at (100, 33).
; PLAN: r0=100(x), r1=33(y), r2=58(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 33
LDI r2, 58
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
