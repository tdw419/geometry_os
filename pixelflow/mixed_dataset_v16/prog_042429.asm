; DESCRIPTION: Renders a purple rectangular region spanning 84 by 46 at (70, 182).
; PLAN: r0=70(x), r1=182(y), r2=84(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 182
LDI r2, 84
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
