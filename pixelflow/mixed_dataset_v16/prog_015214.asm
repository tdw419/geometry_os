; DESCRIPTION: Renders a magenta box of size 92x31 starting at (304, 81).
; PLAN: r0=304(x), r1=81(y), r2=92(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 81
LDI r2, 92
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
