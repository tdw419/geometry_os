; DESCRIPTION: Renders a magenta box of size 79x73 starting at (137, 59).
; PLAN: r0=137(x), r1=59(y), r2=79(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 59
LDI r2, 79
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
