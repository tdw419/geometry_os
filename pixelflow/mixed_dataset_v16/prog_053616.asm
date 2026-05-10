; DESCRIPTION: Creates a red rectangular region at (355, 160) spanning 103 by 20 pixels.
; PLAN: r0=355(x), r1=160(y), r2=103(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 160
LDI r2, 103
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
