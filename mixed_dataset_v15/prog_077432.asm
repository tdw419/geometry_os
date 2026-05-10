; DESCRIPTION: Creates a red rectangular region at (72, 6) spanning 92 by 52 pixels.
; PLAN: r0=72(x), r1=6(y), r2=92(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 6
LDI r2, 92
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
