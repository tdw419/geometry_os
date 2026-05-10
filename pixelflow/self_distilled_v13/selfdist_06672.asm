; DESCRIPTION: Renders a magenta rectangular region spanning 117 by 103 at (56, 120).
; PLAN: r0=56(x), r1=120(y), r2=117(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 120
LDI r2, 117
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
