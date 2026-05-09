; DESCRIPTION: Creates a red rectangular region at (395, 114) spanning 51 by 91 pixels.
; PLAN: r0=395(x), r1=114(y), r2=51(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 114
LDI r2, 51
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
