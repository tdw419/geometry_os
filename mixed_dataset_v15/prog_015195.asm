; DESCRIPTION: Renders a yellow rectangular region spanning 90 by 64 at (36, 92).
; PLAN: r0=36(x), r1=92(y), r2=90(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 92
LDI r2, 90
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
