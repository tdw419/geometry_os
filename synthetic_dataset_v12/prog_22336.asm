; DESCRIPTION: Renders a purple box of size 56x21 starting at (249, 182).
; PLAN: r0=249(x), r1=182(y), r2=56(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 182
LDI r2, 56
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
