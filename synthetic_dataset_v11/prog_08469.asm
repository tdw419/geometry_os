; DESCRIPTION: Renders a purple box of size 46x98 starting at (135, 95).
; PLAN: r0=135(x), r1=95(y), r2=46(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 95
LDI r2, 46
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
