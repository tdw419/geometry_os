; DESCRIPTION: Renders a purple box of size 12x50 starting at (277, 15).
; PLAN: r0=277(x), r1=15(y), r2=12(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 15
LDI r2, 12
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
