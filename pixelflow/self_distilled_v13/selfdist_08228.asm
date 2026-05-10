; DESCRIPTION: Renders a red rectangular region spanning 24 by 112 at (54, 93).
; PLAN: r0=54(x), r1=93(y), r2=24(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 93
LDI r2, 24
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
