; DESCRIPTION: Renders a magenta box of size 92x25 starting at (68, 142).
; PLAN: r0=68(x), r1=142(y), r2=92(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 142
LDI r2, 92
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
