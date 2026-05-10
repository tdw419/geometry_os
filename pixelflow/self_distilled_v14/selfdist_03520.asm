; DESCRIPTION: Renders a yellow rectangular region spanning 92 by 15 at (263, 168).
; PLAN: r0=263(x), r1=168(y), r2=92(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 168
LDI r2, 92
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
