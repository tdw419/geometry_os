; DESCRIPTION: Renders a magenta box of size 84x73 starting at (39, 144).
; PLAN: r0=39(x), r1=144(y), r2=84(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 144
LDI r2, 84
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
