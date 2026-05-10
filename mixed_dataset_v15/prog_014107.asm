; DESCRIPTION: Creates a red rectangular region at (139, 11) spanning 111 by 16 pixels.
; PLAN: r0=139(x), r1=11(y), r2=111(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 11
LDI r2, 111
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
