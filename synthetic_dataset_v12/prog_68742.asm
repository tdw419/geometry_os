; DESCRIPTION: Renders a purple box of size 70x92 starting at (276, 30).
; PLAN: r0=276(x), r1=30(y), r2=70(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 30
LDI r2, 70
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
