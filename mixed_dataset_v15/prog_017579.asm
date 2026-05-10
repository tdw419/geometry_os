; DESCRIPTION: Renders a purple rectangular region spanning 13 by 17 at (295, 61).
; PLAN: r0=295(x), r1=61(y), r2=13(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 61
LDI r2, 13
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
