; DESCRIPTION: Renders a magenta box of size 116x83 starting at (138, 18).
; PLAN: r0=138(x), r1=18(y), r2=116(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 18
LDI r2, 116
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
