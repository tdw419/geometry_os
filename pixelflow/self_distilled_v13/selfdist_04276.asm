; DESCRIPTION: Renders a red rectangular region spanning 89 by 99 at (240, 117).
; PLAN: r0=240(x), r1=117(y), r2=89(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 117
LDI r2, 89
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
