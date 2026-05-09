; DESCRIPTION: Renders a magenta box of size 120x98 starting at (36, 108).
; PLAN: r0=36(x), r1=108(y), r2=120(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 108
LDI r2, 120
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
