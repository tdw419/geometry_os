; DESCRIPTION: Creates a red rectangular region at (83, 106) spanning 58 by 68 pixels.
; PLAN: r0=83(x), r1=106(y), r2=58(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 106
LDI r2, 58
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
