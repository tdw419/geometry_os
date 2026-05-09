; DESCRIPTION: Creates a red rectangular region at (393, 4) spanning 108 by 89 pixels.
; PLAN: r0=393(x), r1=4(y), r2=108(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 4
LDI r2, 108
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
