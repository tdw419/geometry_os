; DESCRIPTION: Renders a magenta box of size 92x98 starting at (193, 1).
; PLAN: r0=193(x), r1=1(y), r2=92(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 1
LDI r2, 92
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
