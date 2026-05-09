; DESCRIPTION: Renders a magenta box of size 61x92 starting at (174, 122).
; PLAN: r0=174(x), r1=122(y), r2=61(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 122
LDI r2, 61
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
