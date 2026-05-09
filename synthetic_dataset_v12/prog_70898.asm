; DESCRIPTION: Renders a purple box of size 90x120 starting at (241, 17).
; PLAN: r0=241(x), r1=17(y), r2=90(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 17
LDI r2, 90
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
