; DESCRIPTION: Renders a red rectangular region spanning 23 by 52 at (117, 193).
; PLAN: r0=117(x), r1=193(y), r2=23(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 193
LDI r2, 23
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
