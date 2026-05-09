; DESCRIPTION: Renders a purple box of size 70x94 starting at (213, 56).
; PLAN: r0=213(x), r1=56(y), r2=70(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 56
LDI r2, 70
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
