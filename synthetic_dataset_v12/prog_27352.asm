; DESCRIPTION: Renders a magenta box of size 24x65 starting at (226, 11).
; PLAN: r0=226(x), r1=11(y), r2=24(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 11
LDI r2, 24
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
