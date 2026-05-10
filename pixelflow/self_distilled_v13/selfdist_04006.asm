; DESCRIPTION: Renders a purple rectangular region spanning 36 by 47 at (193, 125).
; PLAN: r0=193(x), r1=125(y), r2=36(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 125
LDI r2, 36
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
