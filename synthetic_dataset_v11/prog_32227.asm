; DESCRIPTION: Creates a red rectangular region at (139, 160) spanning 68 by 68 pixels.
; PLAN: r0=139(x), r1=160(y), r2=68(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 160
LDI r2, 68
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
