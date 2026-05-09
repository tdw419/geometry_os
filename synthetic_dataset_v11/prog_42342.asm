; DESCRIPTION: Creates a red rectangular region at (91, 4) spanning 46 by 38 pixels.
; PLAN: r0=91(x), r1=4(y), r2=46(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 4
LDI r2, 46
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
