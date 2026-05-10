; DESCRIPTION: Renders a magenta rectangular region spanning 115 by 90 at (226, 95).
; PLAN: r0=226(x), r1=95(y), r2=115(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 95
LDI r2, 115
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
