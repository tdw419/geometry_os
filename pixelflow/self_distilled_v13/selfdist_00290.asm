; DESCRIPTION: Renders a red rectangular region spanning 20 by 86 at (26, 39).
; PLAN: r0=26(x), r1=39(y), r2=20(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 39
LDI r2, 20
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
