; DESCRIPTION: Creates a red rectangular region at (80, 38) spanning 55 by 60 pixels.
; PLAN: r0=80(x), r1=38(y), r2=55(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 38
LDI r2, 55
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
