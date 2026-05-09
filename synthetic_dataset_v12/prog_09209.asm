; DESCRIPTION: Renders a purple box of size 102x120 starting at (338, 56).
; PLAN: r0=338(x), r1=56(y), r2=102(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 56
LDI r2, 102
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
