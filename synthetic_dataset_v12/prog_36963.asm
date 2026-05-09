; DESCRIPTION: Renders a magenta box of size 71x91 starting at (439, 99).
; PLAN: r0=439(x), r1=99(y), r2=71(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 99
LDI r2, 71
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
