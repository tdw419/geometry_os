; DESCRIPTION: Creates a red rectangular region at (6, 136) spanning 120 by 89 pixels.
; PLAN: r0=6(x), r1=136(y), r2=120(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 136
LDI r2, 120
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
