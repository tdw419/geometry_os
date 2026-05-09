; DESCRIPTION: Creates a yellow rectangular region at (377, 120) spanning 114 by 25 pixels.
; PLAN: r0=377(x), r1=120(y), r2=114(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 120
LDI r2, 114
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
