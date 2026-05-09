; DESCRIPTION: Renders a magenta box of size 73x117 starting at (226, 84).
; PLAN: r0=226(x), r1=84(y), r2=73(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 84
LDI r2, 73
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
