; DESCRIPTION: Renders a magenta rectangular region spanning 87 by 85 at (229, 24).
; PLAN: r0=229(x), r1=24(y), r2=87(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 24
LDI r2, 87
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
