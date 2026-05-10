; DESCRIPTION: Creates a purple rectangular region at (306, 20) spanning 91 by 120 pixels.
; PLAN: r0=306(x), r1=20(y), r2=91(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 20
LDI r2, 91
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
