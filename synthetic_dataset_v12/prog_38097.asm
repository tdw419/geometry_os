; DESCRIPTION: Renders a magenta box of size 12x36 starting at (266, 117).
; PLAN: r0=266(x), r1=117(y), r2=12(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 117
LDI r2, 12
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
