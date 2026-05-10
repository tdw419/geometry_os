; DESCRIPTION: Renders a yellow rectangular region spanning 57 by 72 at (167, 6).
; PLAN: r0=167(x), r1=6(y), r2=57(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 6
LDI r2, 57
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
