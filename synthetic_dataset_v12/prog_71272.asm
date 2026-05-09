; DESCRIPTION: Renders a magenta box of size 55x66 starting at (116, 131).
; PLAN: r0=116(x), r1=131(y), r2=55(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 131
LDI r2, 55
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
