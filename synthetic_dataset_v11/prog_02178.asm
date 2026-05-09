; DESCRIPTION: Renders a magenta box of size 34x48 starting at (8, 76).
; PLAN: r0=8(x), r1=76(y), r2=34(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 76
LDI r2, 34
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
