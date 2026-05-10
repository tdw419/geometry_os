; DESCRIPTION: Renders a magenta box of size 10x67 starting at (387, 147).
; PLAN: r0=387(x), r1=147(y), r2=10(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 147
LDI r2, 10
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
