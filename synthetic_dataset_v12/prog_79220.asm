; DESCRIPTION: Renders a magenta box of size 54x52 starting at (233, 127).
; PLAN: r0=233(x), r1=127(y), r2=54(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 127
LDI r2, 54
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
