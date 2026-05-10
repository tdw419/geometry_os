; DESCRIPTION: Renders a magenta rectangular region spanning 87 by 82 at (245, 10).
; PLAN: r0=245(x), r1=10(y), r2=87(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 10
LDI r2, 87
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
