; DESCRIPTION: Creates a red rectangular region at (86, 38) spanning 75 by 20 pixels.
; PLAN: r0=86(x), r1=38(y), r2=75(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 38
LDI r2, 75
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
