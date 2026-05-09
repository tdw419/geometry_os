; DESCRIPTION: Renders a magenta box of size 112x71 starting at (75, 37).
; PLAN: r0=75(x), r1=37(y), r2=112(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 37
LDI r2, 112
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
