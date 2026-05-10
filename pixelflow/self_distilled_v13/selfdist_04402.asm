; DESCRIPTION: Renders a red rectangular region spanning 78 by 99 at (207, 24).
; PLAN: r0=207(x), r1=24(y), r2=78(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 24
LDI r2, 78
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
