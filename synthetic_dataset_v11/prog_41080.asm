; DESCRIPTION: Creates a red rectangular region at (2, 9) spanning 111 by 38 pixels.
; PLAN: r0=2(x), r1=9(y), r2=111(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 9
LDI r2, 111
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
