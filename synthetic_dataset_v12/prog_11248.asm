; DESCRIPTION: Renders a purple box of size 29x55 starting at (121, 128).
; PLAN: r0=121(x), r1=128(y), r2=29(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 128
LDI r2, 29
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
