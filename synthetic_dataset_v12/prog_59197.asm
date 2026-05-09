; DESCRIPTION: Creates a yellow rectangular region at (287, 23) spanning 93 by 82 pixels.
; PLAN: r0=287(x), r1=23(y), r2=93(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 23
LDI r2, 93
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
