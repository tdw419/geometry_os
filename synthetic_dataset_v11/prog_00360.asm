; DESCRIPTION: Renders a purple box of size 98x69 starting at (111, 55).
; PLAN: r0=111(x), r1=55(y), r2=98(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 55
LDI r2, 98
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
