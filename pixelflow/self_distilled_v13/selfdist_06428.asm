; DESCRIPTION: Renders a purple rectangular region spanning 28 by 87 at (38, 149).
; PLAN: r0=38(x), r1=149(y), r2=28(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 149
LDI r2, 28
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
