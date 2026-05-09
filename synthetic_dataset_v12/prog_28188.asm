; DESCRIPTION: Creates a red rectangular region at (135, 38) spanning 38 by 40 pixels.
; PLAN: r0=135(x), r1=38(y), r2=38(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 38
LDI r2, 38
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
