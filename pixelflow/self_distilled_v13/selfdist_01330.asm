; DESCRIPTION: Renders a magenta rectangular region spanning 16 by 92 at (20, 131).
; PLAN: r0=20(x), r1=131(y), r2=16(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 131
LDI r2, 16
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
