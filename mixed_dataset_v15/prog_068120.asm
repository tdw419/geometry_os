; DESCRIPTION: Renders a purple rectangular region spanning 47 by 21 at (350, 5).
; PLAN: r0=350(x), r1=5(y), r2=47(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 5
LDI r2, 47
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
