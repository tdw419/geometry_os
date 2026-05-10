; DESCRIPTION: Renders a magenta box of size 27x65 starting at (431, 3).
; PLAN: r0=431(x), r1=3(y), r2=27(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 3
LDI r2, 27
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
