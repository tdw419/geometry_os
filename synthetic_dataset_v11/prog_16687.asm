; DESCRIPTION: Renders a magenta box of size 55x58 starting at (189, 156).
; PLAN: r0=189(x), r1=156(y), r2=55(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 156
LDI r2, 55
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
