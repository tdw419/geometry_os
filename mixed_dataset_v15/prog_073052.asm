; DESCRIPTION: Renders a magenta rectangular region spanning 79 by 107 at (301, 185).
; PLAN: r0=301(x), r1=185(y), r2=79(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 185
LDI r2, 79
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
