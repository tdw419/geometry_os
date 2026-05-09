; DESCRIPTION: Renders a purple box of size 55x109 starting at (342, 74).
; PLAN: r0=342(x), r1=74(y), r2=55(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 74
LDI r2, 55
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
