; DESCRIPTION: Renders a magenta box of size 34x116 starting at (91, 36).
; PLAN: r0=91(x), r1=36(y), r2=34(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 36
LDI r2, 34
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
