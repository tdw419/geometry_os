; DESCRIPTION: Renders a magenta box of size 92x58 starting at (348, 168).
; PLAN: r0=348(x), r1=168(y), r2=92(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 168
LDI r2, 92
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
