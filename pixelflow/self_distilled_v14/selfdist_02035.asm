; DESCRIPTION: Renders a purple rectangular region spanning 85 by 65 at (239, 74).
; PLAN: r0=239(x), r1=74(y), r2=85(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 74
LDI r2, 85
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
