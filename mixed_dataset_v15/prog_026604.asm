; DESCRIPTION: Renders a red rectangular region spanning 93 by 40 at (17, 20).
; PLAN: r0=17(x), r1=20(y), r2=93(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 20
LDI r2, 93
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
