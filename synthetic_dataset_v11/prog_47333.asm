; DESCRIPTION: Creates a red rectangular region at (87, 80) spanning 96 by 92 pixels.
; PLAN: r0=87(x), r1=80(y), r2=96(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 80
LDI r2, 96
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
