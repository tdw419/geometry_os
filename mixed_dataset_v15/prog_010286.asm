; DESCRIPTION: Creates a red rectangular region at (236, 2) spanning 25 by 80 pixels.
; PLAN: r0=236(x), r1=2(y), r2=25(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 2
LDI r2, 25
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
