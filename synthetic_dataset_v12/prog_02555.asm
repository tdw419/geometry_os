; DESCRIPTION: Creates a red rectangular region at (398, 77) spanning 76 by 102 pixels.
; PLAN: r0=398(x), r1=77(y), r2=76(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 77
LDI r2, 76
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
