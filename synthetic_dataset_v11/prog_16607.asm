; DESCRIPTION: Renders a magenta box of size 99x12 starting at (0, 54).
; PLAN: r0=0(x), r1=54(y), r2=99(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 54
LDI r2, 99
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
