; DESCRIPTION: Renders a purple rectangular region spanning 47 by 68 at (79, 32).
; PLAN: r0=79(x), r1=32(y), r2=47(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 32
LDI r2, 47
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
