; DESCRIPTION: Renders a magenta box of size 53x12 starting at (7, 92).
; PLAN: r0=7(x), r1=92(y), r2=53(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 92
LDI r2, 53
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
