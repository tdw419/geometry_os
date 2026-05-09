; DESCRIPTION: Creates a red rectangular region at (139, 87) spanning 71 by 111 pixels.
; PLAN: r0=139(x), r1=87(y), r2=71(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 87
LDI r2, 71
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
