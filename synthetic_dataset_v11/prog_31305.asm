; DESCRIPTION: Renders a magenta box of size 76x95 starting at (112, 95).
; PLAN: r0=112(x), r1=95(y), r2=76(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 95
LDI r2, 76
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
