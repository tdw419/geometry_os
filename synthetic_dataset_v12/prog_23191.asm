; DESCRIPTION: Renders a magenta box of size 92x29 starting at (209, 84).
; PLAN: r0=209(x), r1=84(y), r2=92(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 84
LDI r2, 92
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
