; DESCRIPTION: Renders a purple rectangular region spanning 68 by 82 at (291, 149).
; PLAN: r0=291(x), r1=149(y), r2=68(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 149
LDI r2, 68
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
