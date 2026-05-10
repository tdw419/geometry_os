; DESCRIPTION: Renders a red rectangular region spanning 95 by 80 at (321, 193).
; PLAN: r0=321(x), r1=193(y), r2=95(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 193
LDI r2, 95
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
