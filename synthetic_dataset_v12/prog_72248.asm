; DESCRIPTION: Renders a magenta box of size 92x44 starting at (57, 14).
; PLAN: r0=57(x), r1=14(y), r2=92(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 14
LDI r2, 92
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
