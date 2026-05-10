; DESCRIPTION: Renders a red rectangular region spanning 12 by 119 at (308, 31).
; PLAN: r0=308(x), r1=31(y), r2=12(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 31
LDI r2, 12
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
