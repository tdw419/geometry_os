; DESCRIPTION: Renders a magenta box of size 43x31 starting at (39, 84).
; PLAN: r0=39(x), r1=84(y), r2=43(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 84
LDI r2, 43
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
