; DESCRIPTION: Renders a red rectangular region spanning 80 by 97 at (120, 120).
; PLAN: r0=120(x), r1=120(y), r2=80(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 120
LDI r2, 80
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
