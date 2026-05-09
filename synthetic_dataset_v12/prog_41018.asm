; DESCRIPTION: Renders a magenta box of size 95x57 starting at (105, 7).
; PLAN: r0=105(x), r1=7(y), r2=95(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 7
LDI r2, 95
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
