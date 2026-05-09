; DESCRIPTION: Renders a magenta box of size 39x66 starting at (127, 72).
; PLAN: r0=127(x), r1=72(y), r2=39(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 72
LDI r2, 39
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
