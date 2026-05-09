; DESCRIPTION: Renders a magenta box of size 91x20 starting at (234, 7).
; PLAN: r0=234(x), r1=7(y), r2=91(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 7
LDI r2, 91
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
