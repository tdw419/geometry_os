; DESCRIPTION: Creates a red rectangular region at (139, 160) spanning 35 by 44 pixels.
; PLAN: r0=139(x), r1=160(y), r2=35(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 160
LDI r2, 35
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
