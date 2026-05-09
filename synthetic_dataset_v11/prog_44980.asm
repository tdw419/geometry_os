; DESCRIPTION: Creates a red rectangular region at (40, 43) spanning 120 by 91 pixels.
; PLAN: r0=40(x), r1=43(y), r2=120(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 43
LDI r2, 120
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
