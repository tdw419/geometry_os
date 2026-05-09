; DESCRIPTION: Renders a magenta box of size 34x109 starting at (189, 19).
; PLAN: r0=189(x), r1=19(y), r2=34(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 19
LDI r2, 34
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
