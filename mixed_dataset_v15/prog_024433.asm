; DESCRIPTION: Renders a purple rectangular region spanning 85 by 98 at (244, 143).
; PLAN: r0=244(x), r1=143(y), r2=85(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 143
LDI r2, 85
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
