; DESCRIPTION: Renders a red rectangular region spanning 60 by 47 at (163, 32).
; PLAN: r0=163(x), r1=32(y), r2=60(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 32
LDI r2, 60
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
