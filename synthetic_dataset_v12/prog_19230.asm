; DESCRIPTION: Renders a magenta box of size 61x72 starting at (362, 123).
; PLAN: r0=362(x), r1=123(y), r2=61(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 123
LDI r2, 61
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
