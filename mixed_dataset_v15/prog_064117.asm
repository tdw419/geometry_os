; DESCRIPTION: Creates a red rectangular region at (40, 131) spanning 112 by 99 pixels.
; PLAN: r0=40(x), r1=131(y), r2=112(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 131
LDI r2, 112
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
