; DESCRIPTION: Renders a red rectangular region spanning 100 by 87 at (57, 47).
; PLAN: r0=57(x), r1=47(y), r2=100(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 47
LDI r2, 100
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
