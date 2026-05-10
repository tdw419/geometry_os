; DESCRIPTION: Renders a yellow rectangular region spanning 107 by 72 at (135, 54).
; PLAN: r0=135(x), r1=54(y), r2=107(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 54
LDI r2, 107
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
