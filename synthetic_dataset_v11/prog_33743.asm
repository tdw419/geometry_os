; DESCRIPTION: Creates a yellow rectangular region at (158, 150) spanning 25 by 72 pixels.
; PLAN: r0=158(x), r1=150(y), r2=25(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 150
LDI r2, 25
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
