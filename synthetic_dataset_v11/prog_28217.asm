; DESCRIPTION: Renders a magenta box of size 62x112 starting at (187, 13).
; PLAN: r0=187(x), r1=13(y), r2=62(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 13
LDI r2, 62
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
