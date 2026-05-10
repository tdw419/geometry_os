; DESCRIPTION: Renders a purple rectangular region spanning 77 by 96 at (46, 127).
; PLAN: r0=46(x), r1=127(y), r2=77(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 127
LDI r2, 77
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
