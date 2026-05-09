; DESCRIPTION: Renders a magenta box of size 27x59 starting at (147, 66).
; PLAN: r0=147(x), r1=66(y), r2=27(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 66
LDI r2, 27
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
