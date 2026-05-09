; DESCRIPTION: Renders a magenta box of size 48x107 starting at (73, 39).
; PLAN: r0=73(x), r1=39(y), r2=48(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 39
LDI r2, 48
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
