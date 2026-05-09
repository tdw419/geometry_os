; DESCRIPTION: Creates a red rectangular region at (185, 22) spanning 77 by 72 pixels.
; PLAN: r0=185(x), r1=22(y), r2=77(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 22
LDI r2, 77
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
