; DESCRIPTION: Renders a magenta box of size 59x66 starting at (349, 65).
; PLAN: r0=349(x), r1=65(y), r2=59(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 65
LDI r2, 59
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
