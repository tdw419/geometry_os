; DESCRIPTION: Renders a magenta rectangular region spanning 76 by 47 at (150, 172).
; PLAN: r0=150(x), r1=172(y), r2=76(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 172
LDI r2, 76
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
