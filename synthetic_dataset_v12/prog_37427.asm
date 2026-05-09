; DESCRIPTION: Renders a purple box of size 59x55 starting at (121, 93).
; PLAN: r0=121(x), r1=93(y), r2=59(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 93
LDI r2, 59
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
