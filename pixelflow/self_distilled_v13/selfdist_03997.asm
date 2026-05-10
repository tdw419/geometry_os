; DESCRIPTION: Renders a purple rectangular region spanning 85 by 47 at (244, 140).
; PLAN: r0=244(x), r1=140(y), r2=85(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 140
LDI r2, 85
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
