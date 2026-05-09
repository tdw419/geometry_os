; DESCRIPTION: Renders a magenta box of size 47x112 starting at (13, 95).
; PLAN: r0=13(x), r1=95(y), r2=47(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 95
LDI r2, 47
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
