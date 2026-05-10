; DESCRIPTION: Renders a magenta rectangular region spanning 47 by 85 at (387, 126).
; PLAN: r0=387(x), r1=126(y), r2=47(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 126
LDI r2, 47
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
