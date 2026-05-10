; DESCRIPTION: Renders a red rectangular region spanning 46 by 49 at (279, 4).
; PLAN: r0=279(x), r1=4(y), r2=46(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 4
LDI r2, 46
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
