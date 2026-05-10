; DESCRIPTION: Renders a magenta box of size 95x91 starting at (212, 94).
; PLAN: r0=212(x), r1=94(y), r2=95(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 94
LDI r2, 95
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
