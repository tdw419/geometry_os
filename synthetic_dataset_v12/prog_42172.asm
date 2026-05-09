; DESCRIPTION: Creates a red rectangular region at (280, 90) spanning 92 by 89 pixels.
; PLAN: r0=280(x), r1=90(y), r2=92(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 90
LDI r2, 92
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
