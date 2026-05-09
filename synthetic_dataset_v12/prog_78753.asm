; DESCRIPTION: Creates a red rectangular region at (80, 40) spanning 46 by 54 pixels.
; PLAN: r0=80(x), r1=40(y), r2=46(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 40
LDI r2, 46
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
