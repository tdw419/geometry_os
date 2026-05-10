; DESCRIPTION: Renders a purple rectangular region spanning 110 by 82 at (295, 179).
; PLAN: r0=295(x), r1=179(y), r2=110(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 179
LDI r2, 110
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
