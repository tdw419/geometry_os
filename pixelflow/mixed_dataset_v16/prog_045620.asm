; DESCRIPTION: Renders a purple box of size 55x55 starting at (381, 55).
; PLAN: r0=381(x), r1=55(y), r2=55(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 55
LDI r2, 55
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
