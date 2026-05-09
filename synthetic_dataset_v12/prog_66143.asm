; DESCRIPTION: Renders a magenta box of size 92x99 starting at (55, 16).
; PLAN: r0=55(x), r1=16(y), r2=92(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 16
LDI r2, 92
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
