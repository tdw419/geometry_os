; DESCRIPTION: Renders a magenta box of size 61x72 starting at (68, 156).
; PLAN: r0=68(x), r1=156(y), r2=61(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 156
LDI r2, 61
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
