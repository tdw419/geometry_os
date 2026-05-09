; DESCRIPTION: Renders a magenta box of size 65x15 starting at (24, 46).
; PLAN: r0=24(x), r1=46(y), r2=65(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 46
LDI r2, 65
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
