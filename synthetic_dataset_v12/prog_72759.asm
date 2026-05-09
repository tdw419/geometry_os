; DESCRIPTION: Renders a magenta box of size 95x116 starting at (99, 80).
; PLAN: r0=99(x), r1=80(y), r2=95(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 80
LDI r2, 95
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
