; DESCRIPTION: Renders a magenta box of size 110x59 starting at (29, 157).
; PLAN: r0=29(x), r1=157(y), r2=110(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 157
LDI r2, 110
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
